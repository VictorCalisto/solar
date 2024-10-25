# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Criando ou encontrando o usuário Atendente
User.find_or_create_by!(email: 'atendente@exemplo.com') do |user|
  user.password = '123456'
  user.password_confirmation = '123456'
end

# Criando ou encontrando o usuário Chefe
User.find_or_create_by!(email: 'chefe@exemplo.com') do |user|
  user.password = '123456'
  user.password_confirmation = '123456'
end

##############################
require 'faker'
require 'i18n'

def gerar_email(nome_completo)
  nome_sem_acentos = I18n.transliterate(nome_completo.downcase)
  mail = nome_sem_acentos.gsub(/\s+/, '.').gsub(/[^a-z.]/, '') + '@exemplo.com'

  mail
end

10.times do
  nome_completo = Faker::Name.name

  while nome_completo !~ /\A[a-zA-ZÀ-ÿ\s]+\z/
    nome_completo = Faker::Name.name
  end

  email = gerar_email(nome_completo)

  Contato.create!(
    nome: nome_completo,
    email: email,
    telefone: "629#{rand(10000000..99999999)}",
    whatsapp: "629#{rand(10000000..99999999)}",
    horario_preferencial: Time.zone.now.change(hour: rand(8..18), min: 0)
  )
end

########################
