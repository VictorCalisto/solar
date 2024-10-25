class PagesController < ApplicationController
  include PagesHelper

  def home
    if request.get?
      @resultado = nil

    elsif request.post?
      valor = formatar_valor(params[:valor])

      # Atribui o valor ao atributo de classe `valor`
      Page.valor = valor

      # Como não estamos validando uma instância, a validação deve ser adaptada
      if valor.present? && valor.is_a?(Numeric) # Exemplo simples de validação
        @resultado = Page.calcular_quantidade(valor)

        # Formata os resultados antes de exibir
        @resultado[:total] = formatar_numero(@resultado[:total])
        @resultado[:cervejas] = formatar_numero(@resultado[:cervejas])
        @resultado[:pizzas] = formatar_numero(@resultado[:pizzas])
        @resultado[:chocolates] = formatar_numero(@resultado[:chocolates])

      else
        @errors = [ "Valor inválido" ]
        flash.now[:alert] = "Digite um valor válido."
      end
    end
  end



  def informacoes
  end
end
