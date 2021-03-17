# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }
# filepath    = 'db/products.csv'

# CSV.foreach(filepath, csv_options) do |row|
#   Product.create(
#     name: row['name'],
#     fabricant: row['fabricant'],
#     element: row['element'],
#     revetement: row['revetement'],
#     price: row['price'],
#     category: row['category'],
#     height: row['height'],
#     width: row['width'],
#     deep: row['deep']
#   )
# end




# CSV.foreach(Rails.root.join('db/natuzzi.csv'), headers: true) do |row|
#   Product.create({
#     fabricant: row[0],
#     element: row[1],
#     revetement: row[2],
#     category: row[3],
#     price: row[4],
#     height: row[5],
#     width: row[6],
#     deep: row[7],
#     name: row[8]
#   })
# end

Produit.destroy_all
Devi.destroy_all
User.destroy_all

name = ['GICQUIAUD', 'FORVEILLE', 'DUPAS', 'VERGNAC', 'BUNOT', 'COCAULT',
'SUSINI', 'GRENIER', 'LEROY', 'CHARDONNAL']

prenom = ['Roger', 'Aline', 'Anastasia']

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
number = 1001
decorateur = ['Élise', 'David', 'Anthony', 'Autre']



puts '-------------'
puts 'User principal'

my_user = User.new(
  email: 'nantes@livingstore.fr',
  password: 'devisclients'
)
  my_user.save!

puts '-----------------------'

puts 'Creating some devis'

10.times do
  new_devis = Devi.new(
    nom: name.sample,
    prenom: prenom.sample,
    telephone: phone_number.sample,
    email: email.sample,
    numero: number,
    decorateur: decorateur.sample,
    user_id: my_user.id
    )
  number += 1
  new_devis.save!
end



puts '-------------------'

puts "Let's create some data ✨"

puts 'Adding all the products... ✨'

30. times do
  new_product = Produit.new(
    name: name_product.sample,
    fabricant: fabricant.sample,
    element: element.sample,
    revetement: revetement.sample,
    category: category.sample,
    price: price.sample,
    width: width.sample,
    height: height.sample,
    deep: deep.sample,
    devi_id: Devi.last.id
  )
  new_product.save!
end
