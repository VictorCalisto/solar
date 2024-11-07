# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(funcionario)

    return if funcionario.nil?

    can :update, Funcionario, id: funcionario.id

    case funcionario.cargo
    when :chefe
      can :create, Funcionario
      can :destroy, Funcionario
    when :atendente
      cannot :create, Funcionario
      cannot :destroy, Funcionario
    end
  end
end
