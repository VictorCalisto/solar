class Funcionario < ApplicationRecord
  belongs_to :user

  attr_accessor :email,:password,:password_confirmation

  CARGOS = { atendente: 'atendente', chefe: 'chefe' }.freeze

  validates :nome, presence: true
  validates :cargo, presence: true, inclusion: { in: CARGOS.values }

  def chefe?
    cargo == CARGOS[:chefe]
  end

  def self.create!(params)
    ActiveRecord::Base.transaction do
      user = User.find_or_create_by!(email: params[:email]) do |user|
        user.password = params[:password]
        user.password_confirmation = params[:password_confirmation]
      end
      
      params[:user_id] = user.id
      
      super(params.except(:email, :password, :password_confirmation))
    end
  end
  def self.create(params)
    self.create!(params)
  end
  def save(*args)
    if self.user.nil?
      self.user = User.create!(email: email, password: password, password_confirmation: password_confirmation)
    end

    self.user_id = self.user.id

    super(*args)
  rescue ActiveRecord::RecordInvalid => e
    errors.add(:base, "Erro ao salvar o usuário ou funcionário: #{e.message}")
    return false
  end
  def save!(*args)
    save(*args)
  end
end
