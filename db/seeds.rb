require "faker"

puts "🔄 Nettoyage des données..."
User.delete_all
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='users'")

puts "👤 Ajout des utilisateurs"
User.create!(email: "test@test.com", password: "password", password_confirmation: "password")

10.times do
  password = "password"
  User.create!(
    email: Faker::Internet.unique.email,
    password: password,
    password_confirmation: password
  )
end


puts "✅ Seeds terminés !"
