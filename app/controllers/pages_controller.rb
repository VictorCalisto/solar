class PagesController < ApplicationController
  
  def home
    if request.get?
      page = Page.new
      @resultado = nil
    elsif request.post?
      valor = params[:valor].gsub("R$", "").gsub(",", "").to_f
      @resultado = Page.calcular_quantidade(valor)

    end
    
  end

  def contato
  end

  def informacoes
  end

  private

  
end
