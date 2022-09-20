# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# USERS SEED
puts "Destroying Users..."
User.destroy_all
puts "Creating users..."
user_1 = { prenom: "Franck", nom: "Megret", email: "msynthese@gmail.com", password: "123456", naissance: "1973-05-21", adresse: "114 rue la vie du char", cp: "01130", ville: "Echallon", pays: "France", telephone_portable: "07-86-29-45-52", admin: true }
user_2 = { prenom: "Melanie", nom: "Megret", email: "melanie01550@hotmail.fr", password: "123456", naissance:" 1979-08-13", adresse: "114 rue la vie du char", cp: "01130", ville: "Echallon", pays: "France", telephone_portable: "06-09-05-05-97" }
[user_1, user_2].each do |attributes|
  user = User.create!(attributes)
  puts "Created #{user.email}"
end
puts "All users created!"


puts "Destroying Clients..."
Client.destroy_all
puts "Creating Clients..."
client_1 = { prenom: "corentin", nom: "Megret", email: "corentin@gmail.com", adresse: "114 rue la vie du char", cp: "01130", ville: "Echallon", pays: "France", telephone_portable: "07-86-29-45-52"}
client_2 = { prenom: "evann", nom: "Megret", email: "evann@hotmail.fr", adresse: "114 rue la vie du char", cp: "01130", ville: "Echallon", pays: "France", telephone_portable: "06-09-05-05-97" }
[client_1, client_2].each do |attributes|
  client = Client.create!(attributes)
  puts "Created #{client.email}"
end
puts "All clients created!"
