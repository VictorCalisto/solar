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
  def update(attributes, *args)
    # Verifica se o Funcionario já possui um User associado
    if self.user.present?
      # Verifica se a senha antiga foi fornecida
      if attributes[:current_password].present?
        # Verifica se a senha antiga é válida
        unless self.user.valid_password?(attributes[:current_password])
          errors.add(:current_password, 'Senha atual incorreta.')
          return false
        end
  
        # Atualiza o User com os novos dados
        user_attributes = {
          email: attributes[:email],
          password: attributes[:password],
          password_confirmation: attributes[:password_confirmation]
        }.compact # Remove campos nulos caso alguns não tenham sido alterados
  
        unless self.user.update(user_attributes)
          # Adiciona erros do User ao Funcionario caso a atualização do User falhe
          self.user.errors.each { |field, message| errors.add(field, message) }
          return false
        end
      else
        errors.add(:current_password, 'Senha atual é obrigatória para alterar a senha.')
        return false
      end
    else
      errors.add(:user, 'Usuário associado não encontrado.')
      return false
    end
  
    # Agora, chama o método update do ActiveRecord para atualizar o Funcionario
    super(attributes.except(:email, :password, :password_confirmation, :current_password), *args)
  rescue ActiveRecord::RecordInvalid => e
    # Captura e adiciona qualquer erro encontrado durante a atualização
    errors.add(:base, "Erro ao atualizar: #{e.message}")
    false
  end

  def destroy!
    # Verifica se o Funcionario tem um User associado
    if user.present?
      # Tenta excluir o User
      begin
        user.destroy!
      rescue ActiveRecord::RecordNotDestroyed => e
        # Adiciona um erro se a exclusão do User falhar
        errors.add(:base, "Erro ao excluir o usuário associado: #{e.message}")
        return false
      end
    end
  
    # Após excluir o User, tenta excluir o Funcionario
    super
  rescue ActiveRecord::RecordNotDestroyed => e
    # Captura e adiciona qualquer erro encontrado durante a exclusão do Funcionario
    errors.add(:base, "Erro ao excluir o funcionário: #{e.message}")
    false
  end
  
  
end
