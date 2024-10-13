class Contato < ApplicationRecord
  attr_accessor :mesmoTelefone

  validates :telefone, 
    presence: { message: "não pode ficar em branco" }, 
    numericality: { only_integer: true, message: "deve ser um número válido" },
    length: { minimum: 10, maximum: 11, message: "deve ter entre 10 e 11 dígitos" }

  # validates :whatsapp, presence: { message: "não pode ficar em branco" }, unless: :mesmo_telefone_checked?
  
  # validates :whatsapp, 
  #   numericality: { only_integer: true, message: "deve ser um número válido" },
  #   length: { minimum: 10, maximum: 11, message: "deve ter entre 10 e 11 dígitos" }
  
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "deve ser um email válido" }

  validates :nome, presence: true, format: { with: /\A[a-zA-ZÀ-ÿ\s]+\z/, message: "deve conter apenas letras e espaços" }

  def mesmo_telefone_checked?
    mesmoTelefone == "true" || mesmoTelefone == true
  end

end
