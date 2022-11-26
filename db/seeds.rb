# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AdminUser.first_or_create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Activity.first_or_create!(name: 'Proteção a animais')
Activity.first_or_create!(name: 'Religião')
Activity.first_or_create!(name: 'Meio Ambiente')
Activity.first_or_create!(name: 'Educação')
Activity.first_or_create!(name: 'Assistência Social')
Activity.first_or_create!(name: 'Saúde')
Activity.first_or_create!(name: 'Comunidade')
Activity.first_or_create!(name: 'Defesa de minorias')
Activity.first_or_create!(name: 'Empreendedorismo')
Activity.first_or_create!(name: 'Proteção Infantil')