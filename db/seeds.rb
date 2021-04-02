# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

name = ['GICQUIAUD', 'FORVEILLE', 'DUPAS', 'VERGNAC', 'BUNOT', 'COCAULT',
'SUSINI', 'GRENIER', 'LEROY', 'CHARDONNAL']

prenom = ['Catherine', 'Lilio', 'Lewis', 'Amandine']

phone_number = ['0647284920', '0946178212', '065678941']

address = ["9 rue bouquière, bordeaux", "22 quai duguay trouin, rennes", "9 rue du chemin vert, paris", "6 rue pizay, lyon", "4 rue des cigognes, strasbourg", "10 rue du guesclin, marseille"]

email = ['jean@hotmail.fr', 'evelyne@gmail.com', 'thibault@live.fr']

fabricant = ['Natuzzi', 'Nicoletti Home', 'Devina Nais']
element = ['C2', 'CL', 'C2,5', 'C3']
revetement = ['cuir', 'tissu']
category = ["NB", "70", "85", "ND", "NA", "99"]
price = [1000, 2000, 3000, 4000]
width = [180, 199, 203]
height = [98, 103, 94]
deep = [94, 103, 86]
name_product = ['Tratto', 'Monnalisa', 'Bamboo', 'Borghese', 'Iago', 'Serena', 'Brooklyn', 'Megan', 'Wave', 'Pablo']


number = [43528, 43529, 43531, 43532, 43533, 43534, 43535, 43536, 43537, 43538]
decorateur = ['Élise', 'David', 'Anthony', 'Autre']

Produit.destroy_all
Devi.destroy_all
User.destroy_all

puts '-----------------------'

puts 'creating a user'

user = User.new(
  email: 'nantes@livingstore.fr',
  password: '12345678'
  )
user.save!


puts '-------------------'

puts 'Creating some devis'

10.times do
  new_devi = Devi.new(
    nom: name.sample,
    prenom: prenom.sample,
    telephone: phone_number.sample,
    adresse: address.sample,
    email: email.sample,
    decorateur: decorateur.sample,
    numero: number.sample,
    user_id: user.id,
  )
  new_devi.save!
end
puts '-------------------------------'
puts 'Adding all the products... ✨'
# 30. times do
#   new_product = Produit.new(
#     name: name_product.sample,
#     fabricant: fabricant.sample,
#     element: element.sample,
#     revetement: revetement.sample,
#     category: category.sample,
#     price: price.sample,
#     width: width.sample,
#     height: height.sample,
#     deep: deep.sample,
#     devi_id: Devi.last.id
#   )
#   new_product.save!
# end


csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }
filepath    = 'db/produIts.csv'

CSV.foreach(filepath, csv_options) do |row|
  Produit.create(
    name: row['name'],
    fabricant: row['fabricant'],
    element: row['element'],
    revetement: row['revetement'],
    price: row['price'],
    category: row['category'],
    height: row['height'],
    width: row['width'],
    deep: row['deep'],
    devi_id: Devi.last.id
  )
end
