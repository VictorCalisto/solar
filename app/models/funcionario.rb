class Funcionario < ApplicationRecord
  belongs_to :user,dependent: :destroy 

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

  def update!(params, funcionario_logado)
    update_user(params)
    
    if params[:cargo].present? && !funcionario_logado.chefe?
      errors.add(:cargo, 'Somente um usuário chefe pode alterar o cargo.')
      return false
    end

    if params.except(:cargo).to_unsafe_h.any? && funcionario_logado.id != self.id && !funcionario_logado.chefe?
      errors.add(:base, 'Somente o próprio funcionário ou um chefe pode editar esses dados.')
      return false
    end

    super(params.except(:current_password, :password, :password_confirmation, :email))
  end
  def update(params, funcionario_logado)
    update!(params, funcionario_logado)
  end
  
  private
  
  def update_user(params)
    if params[:email]
      user.update!(email: params[:email])
    end
  
    if params[:current_password].present? && user.valid_password?(params[:current_password])
      user.update!(password: params[:password], password_confirmation: params[:password_confirmation])
    end
  end
    
end
