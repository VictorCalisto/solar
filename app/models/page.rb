class Page < ApplicationRecord
  INFLACAO_ANUAL = 7.65
  PRECO_CERVEJA = 10
  PRECO_PIZZA = 60
  PRECO_CHOCOLATE = 10

  validates :valor, presence: true, numericality: { greater_than: 0, message: "Minimo 0,01" }

  def self.calcular_quantidade(valor_mensal)
    total_acumulado = 0
    10.times do |ano|
      12.times { total_acumulado += valor_mensal }  
      total_acumulado *= (1 + INFLACAO_ANUAL)
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
end
