class PagesController < ApplicationController
  include PagesHelper

  def home
    if request.get?
      page = Page.new
      @resultado = nil

    elsif request.post?
      valor = formatar_valor(params[:valor])
      page = Page.new(valor: valor)
      
      if page.valid?
        @resultado = Page.calcular_quantidade(valor)
      else
        @errors = page.errors.full_messages
      end

    end
    
  end

  def informacoes
  end

  private

  
end
