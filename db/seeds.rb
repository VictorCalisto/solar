require 'faker'
require 'i18n'

def email
  nome_sem_acentos = nome_completo()
  nome_sem_acentos = I18n.transliterate(nome_sem_acentos.downcase)
  nome_sem_acentos.gsub(/\s+/, '.').gsub(/[^a-z.]/, '') + '@exemplo.com'
end

def nome_completo
  nome_completo = Faker::Name.name

  while nome_completo !~ /\A[a-zA-ZÀ-ÿ\s]+\z/
    nome_completo = Faker::Name.name
  end

  nome_completo
end

# Criação de Funcionários específicos
user1 = User.create!(
  email: 'atendente@exemplo.com',
  password: '123456',
  password_confirmation: '123456'
)
Funcionario.create!(
  user: user1,
  nome: 'Atendente Exemplo',
  cargo: Funcionario::CARGOS[:atendente]
)

user2 = User.create!(
  email: 'chefe@exemplo.com',
  password: '123456',
  password_confirmation: '123456'
)
Funcionario.create!(
  user: user2,
  nome: 'Chefe Exemplo',
  cargo: Funcionario::CARGOS[:chefe]
)

10.times do
  cargo = [ Funcionario::CARGOS[:atendente], Funcionario::CARGOS[:chefe] ].sample

  user = User.create!(
    email: email(),
    password: '123456',
    password_confirmation: '123456'
  )
  Funcionario.create!(
    user: user,
    nome: nome_completo(),
    cargo: cargo
  )
end

10.times do
  Contato.create!(
    nome: nome_completo(),
    email: email(),
    telefone: "629#{rand(10000000..99999999)}",
    whatsapp: "629#{rand(10000000..99999999)}",
    horario_preferencial: Time.zone.now.change(hour: rand(8..18), min: 0)
  )
end
