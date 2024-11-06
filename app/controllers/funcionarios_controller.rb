class FuncionariosController < ApplicationController
  before_action :set_funcionario, only: %i[ show edit update destroy ]

  # GET /funcionarios or /funcionarios.json
  def index
    @funcionarios = Funcionario.all
  end

  # GET /funcionarios/1 or /funcionarios/1.json
  def show
  end

  # GET /funcionarios/new
  def new
    @funcionario = Funcionario.new
  end

  # GET /funcionarios/1/edit
  def edit
  end

  # POST /funcionarios or /funcionarios.json
  def create
    @funcionario = Funcionario.new(funcionario_params)

    respond_to do |format|
      if @funcionario.save
        format.html { redirect_to @funcionario, notice: "Funcionario was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funcionarios/1 or /funcionarios/1.json
  def update
    respond_to do |format|
      if @funcionario.update(funcionario_params)
        format.html { redirect_to @funcionario, notice: "Funcionario was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funcionarios/1 or /funcionarios/1.json
  def destroy
    @funcionario.destroy!

    respond_to do |format|
      format.html { redirect_to funcionarios_path, status: :see_other, notice: "Funcionario was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funcionario
      @funcionario = Funcionario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def funcionario_params
      params.require(:funcionario).permit(:nome, :cargo, :email,:password, :password_confirmation)
    end
end
