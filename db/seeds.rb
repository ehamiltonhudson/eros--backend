# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DatabaseCleaner.clean_with(:truncation)

all_suns = RestClient.get('https://zodiacal.herokuapp.com/api')
suns_array = JSON.parse(all_suns)
suns_array.each do |hash|
  Sun.create!(sign: hash["name"], start_date: hash["sun_dates"].first,
  end_date: hash["sun_dates"].last, compat_signs: hash["compatibility"].join(", "))
end

User.create!(first_name: "Hamilton", last_name: "Hudson", birth_year: 1989, birth_month: 8, birth_day: 2)
User.create!(first_name: "Eva", last_name: "Hudson", birth_year: 1992, birth_month: 5, birth_day: 1)
User.create!(first_name: "Downing", last_name: "Hudson", birth_year: 1957, birth_month: 8, birth_day: 31)
User.create!(first_name: "Biff", last_name: "Hudson", birth_year: 1953, birth_month: 6, birth_day: 2)

# suns_array.each do |hash|
#   Sun.create(sign: hash["name"], start_date: hash["sun_dates"].first,
#   end_date: hash["sun_dates"].last, keywords: hash["keywords"].join(", "),
#   symbol: hash["symbol"], element: hash["element"], quality: hash["cardinality"],
#   vibe: hash["vibe"], mental_traits: hash["mental_traits"].join(", "),
#   physical_traits: hash["physical_traits"].join(", "))
