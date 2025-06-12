require "faker"

puts "🔄 Nettoyage des données..."
User.delete_all
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='users'")

puts "👤 Ajout des utilisateurs"
User.create!(email: "test@test.com", password_digest: "password")
10.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password_digest: "password"
  )
end

puts "✅ Seeds terminés !"