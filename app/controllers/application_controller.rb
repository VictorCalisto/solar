class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :set_funcionario

  private

  def set_funcionario
    @funcionario ||= Funcionario.find_by(id: session[:funcionario_id]) if session[:funcionario_id]
  end
end
