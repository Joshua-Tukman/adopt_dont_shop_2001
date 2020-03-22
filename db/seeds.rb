# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
shelter_1 = Shelter.create(name: "New Best Friend Shelter",
                     address: "145 Hound Dog Lane",
                     city: "Denver",
                     state: "Colorado",
                     zipcode: "80209")

doggie_1 = Pet.create(name: "Lucille",
                     image: "https://www.pspca.org/sites/default/files/styles/pspca_banner/public/2017-07/34719489134_2eb736aab8_o.jpg?h=2edb335a&itok=YkhiwaEL",
                     approx_age: 8,
                     sex: "female",
                     shelter_id:shelter_1.id
                      )

doggie_2 = Pet.create(name: "George",
                     image: "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/12130118/Golden-Retriever-Standing1-400x267.jpg",
                     approx_age: 4,
                     sex: "male",
                     shelter_id:shelter_1.id
                        )
