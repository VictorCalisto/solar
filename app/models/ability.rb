# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.is_a?(Funcionario)

    can :read, Funcionario
    can :update, Funcionario, id: user.id

    case user.papel
    when :chefe
      can :create, Funcionario
      can :destroy, Funcionario, id: user.id
      can :destroy, Funcionario, id: Funcionario.where.not(id: user.id).pluck(:id)
    when :atendente
      cannot :create, Funcionario
      cannot :destroy, Funcionario
    end
  end
end
