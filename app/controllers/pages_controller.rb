class PagesController < ApplicationController
  include PagesHelper

  def home
    @page = Page.new

    if request.get?
      @resultado = nil
      
    elsif request.post?
      valor = formatar_valor(params[:valor])
      @page = Page.new(valor: valor)

      if @page.valid?
        @resultado = Page.calcular_quantidade(valor)
        @resultado[:total]= formatar_numero(@resultado[:total])
        @resultado[:cervejas]= formatar_numero(@resultado[:cervejas])
        @resultado[:pizzas]= formatar_numero(@resultado[:pizzas])
        @resultado[:chocolates]= formatar_numero(@resultado[:chocolates])
        @resultado

      else
        @errors = @page.errors.full_messages
        flash.now[:alert] = "Digite um valor valido."
      end
    end
  end
  
  
  def informacoes
  end
  
end
