class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  
  before_action :set_ability
  private

  def set_ability
    @funcionario_logado = Funcionario.find_by(user_id: current_user.id) if current_user
    @current_ability = Ability.new(@funcionario)
  end
end
