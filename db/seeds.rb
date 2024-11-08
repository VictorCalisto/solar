require 'faker'
require 'i18n'

def gerar_email(nome)
  nome_sem_acentos = I18n.transliterate(nome.downcase)
  nome_sem_acentos.gsub(/\s+/, '.').gsub(/[^a-z.]/, '') + '@exemplo.com'
end

def gerar_nome
  nome_completo = Faker::Name.name

  while nome_completo !~ /\A[a-zA-ZÀ-ÿ\s]+\z/
    nome_completo = Faker::Name.name
  end

  nome_completo
end

# Criação de Funcionários específicos
Funcionario.create!(
  nome: 'Atendente',
  cargo: Funcionario::CARGOS[:atendente],
  email: 'atendente@exemplo.com',
  password: '123456',
  password_confirmation: '123456'
)

Funcionario.create!(
  nome: 'Chefe',
  cargo: Funcionario::CARGOS[:chefe],
  email: 'chefe@exemplo.com',
  password: '123456',
  password_confirmation: '123456'
)

10.times do
  cargo = [ Funcionario::CARGOS[:atendente], Funcionario::CARGOS[:chefe] ].sample
  nome = gerar_nome()
  email = gerar_email(nome)

  Funcionario.create!(
  nome: nome,
  cargo: cargo,
  email: email,
  password: '123456',
  password_confirmation: '123456'
)
end

10.times do
  nome = gerar_nome()
  email = gerar_email(nome)

  Contato.create!(
    nome: nome,
    email: email,
    telefone: "629#{rand(10000000..99999999)}",
    whatsapp: "629#{rand(10000000..99999999)}",
    horario_preferencial: Time.zone.now.change(hour: rand(8..18), min: 0)
  )
end
