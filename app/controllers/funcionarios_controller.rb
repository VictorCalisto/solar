class FuncionariosController < ApplicationController
  before_action :set_funcionario, only: %i[ edit update destroy ]
  before_action :authenticate_user!
  # GET /funcionarios or /funcionarios.json
  def index
    @funcionarios = Funcionario.all
  end

  # # GET /funcionarios/1 or /funcionarios/1.json
  # def show
  # end

  # GET /funcionarios/new
  def new
    @funcionario = Funcionario.new
    @funcionario.build_user if @funcionario.user.nil?
  end

  # GET /funcionarios/1/edit
  def edit
  end

  # POST /funcionarios or /funcionarios.json
  def create
    @funcionario = Funcionario.create!(funcionario_params)
    respond_to do |format|
      if @funcionario.persisted?
        format.html { redirect_to funcionarios_path, notice: "Funcionario was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funcionarios/1 or /funcionarios/1.json
  def update
    respond_to do |format|
      if @funcionario.update(funcionario_params, @funcionario_logado)
        format.html { redirect_to funcionarios_path, notice: "Funcionario was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funcionarios/1 or /funcionarios/1.json
  def destroy
    if @funcionario_logado.chefe?
      @funcionario.destroy
       redirect_to funcionarios_path, notice: "Funcionario foi excluido."
    else
      redirect_to funcionarios_path, notice: "Você não tem permissão para excluir Funcionario."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funcionario
      @funcionario = Funcionario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def funcionario_params
      params.require(:funcionario).permit(:nome, :cargo, :email, :password, :password_confirmation, :current_password)
    end
end
