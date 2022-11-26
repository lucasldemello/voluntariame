# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AdminUser.first_or_create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Activity.find_or_create_by(name: 'Proteção a animais')
Activity.find_or_create_by(name: 'Religião')
Activity.find_or_create_by(name: 'Meio Ambiente')
Activity.find_or_create_by(name: 'Educação')
Activity.find_or_create_by(name: 'Assistência Social')
Activity.find_or_create_by(name: 'Saúde')
Activity.find_or_create_by(name: 'Comunidade')
Activity.find_or_create_by(name: 'Defesa de minorias')
Activity.find_or_create_by(name: 'Empreendedorismo')
Activity.find_or_create_by(name: 'Proteção Infantil')