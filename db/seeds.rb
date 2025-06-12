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

puts "🔤 Contenu ajouté"
10.times do
  Post.create!(
    title: Faker::Lorem.sentence(word_count: 3),
    content: Faker::Lorem.paragraph(sentence_count: 4),
    user: User.all.sample
  )
end

puts "✅ Seeds terminés !"
