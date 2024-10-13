class ContatosController < ApplicationController
  before_action :authenticate_user! , only: %i[ edit update destroy index]
  before_action :set_contato, only: %i[ edit update destroy ]

  # GET /contatos or /contatos.json
  def index
    @contatos = Contato.all
  end
  
  # GET /contatos/new
  def new
    @contato = Contato.new
  end

  # GET /contatos/1/edit
  def edit
  end

  # POST /contatos or /contatos.json
  def create

    @contato = Contato.new(contato_params)
    @contato.mesmoTelefone = params[:contato][:mesmoTelefone]

    if @contato.mesmoTelefone == "on"
      @contato.whatsapp = @contato.telefone
    end

    respond_to do |format|
      if @contato.save
        format.html { redirect_to pages_home_path, notice: "Cadastrado com Sucesso. Logo entraremos em contato." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /contatos/1 or /contatos/1.json
  def update
    respond_to do |format|
      if @contato.update(contato_params)
        format.html { redirect_to @contato, notice: "Contato was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contatos/1 or /contatos/1.json
  def destroy
    @contato.destroy!

    respond_to do |format|
      format.html { redirect_to contatos_path, status: :see_other, notice: "Contato was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contato
      @contato = Contato.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contato_params
      params.require(:contato).permit(:nome, :email, :telefone, :whatsapp, :horario_preferencial,:mesmoTelefone)
    end
end
