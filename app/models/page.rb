class Page < ApplicationRecord
  INFLACAO_ANUAL = 7.65
  PRECO_CERVEJA = 10
  PRECO_PIZZA = 60
  PRECO_CHOCOLATE = 10

  validates :valor, presence: true, numericality: { greater_than: 0, message: "Minimo 0,01" }

  def self.calcular_quantidade(valor_mensal)
    total_acumulado = 0
    inflacao_mensal = converter_inflacao_anual_para_mensal()
    10.times do |ano|
      12.times { total_acumulado += valor_mensal }  
      valor_mensal *= (1 + inflacao_mensal)
    end
    total_acumulado = total_acumulado.round(2)
    cervejas = (total_acumulado / PRECO_CERVEJA).round(2)
    pizzas = (total_acumulado / PRECO_PIZZA).round(2)
    chocolates = (total_acumulado / PRECO_CHOCOLATE).round(2)

    {
      total: total_acumulado,
      cervejas: cervejas,
      pizzas: pizzas,
      chocolates: chocolates
    }
  end
  private
  def self.converter_inflacao_anual_para_mensal()
    inflacao_decimal = INFLACAO_ANUAL / 100.0
  
    inflacao_mensal = (1 + inflacao_decimal) ** (1.0 / 12) - 1
  
    (inflacao_mensal * 100)
  end
end
