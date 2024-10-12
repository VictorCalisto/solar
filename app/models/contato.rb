class Contato < ApplicationRecord
  validates :telefone, 
    presence: { message: "não pode ficar em branco" }, 
    numericality: { only_integer: true, message: "deve ser um número válido" },
    length: { minimum: 10, maximum: 15, message: "deve ter entre 10 e 15 dígitos" }

  validates :whatsapp, 
    presence: { message: "não pode ficar em branco" }, 
    numericality: { only_integer: true, message: "deve ser um número válido" },
    length: { minimum: 10, maximum: 15, message: "deve ter entre 10 e 15 dígitos" }

end
