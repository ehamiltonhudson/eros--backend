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

pisces = Sun.find { |sun| sun.sign == "Pisces"}
pisces.compat_signs = "Taurus, Cancer,  Scorpio,  Capricorn"


User.create!(first_name: "Hamilton", last_name: "Hudson", birth_year: 1989, birth_month: 8, birth_day: 2)
User.create!(first_name: "Eva", last_name: "Hudson", birth_year: 1992, birth_month: 5, birth_day: 1)
User.create!(first_name: "Downing", last_name: "Hudson", birth_year: 1957, birth_month: 8, birth_day: 31)
User.create!(first_name: "Biff", last_name: "Hudson", birth_year: 1953, birth_month: 6, birth_day: 2)

# WHAT AM I TRYING TO DO:
#    for one sun, check if the name exists in the other sun's
#    compatibility key (iterate down a level)
#    if it does, create a match and associate one sun give
#    compatibility a sun_id and the other sun gives
#    compatibility a compatible_sun_id (probably need to use
#    zodiacs already created because they have the correct ids
#    alreay in active record as opposed to the api hash)

# def create_compats
  # Sun.all.map do |sun|
# end

# [1, 2, 3, 4].inject(0) { |result, element| result + element } # => 10
#
# Sun
# coms = Sun.all.each { |sun| sun_id = sun.id }
# pats = Sun.all.each { |sun| compatible_sun_id = sun.id }
# #
# compatibilities = coms.map { |c|
#   c.compat_signs.where?
#
# # compatibilities.each { |compatibility| Compatiblity.find_or_create_by(com, pat)}
# one = Sun.all.each_cons(2) { |a, b| p a.compat_signs, b.sign }
# # two = Sun.all.each_cons(2) { |a, b| [a.compat_signs, b.sign] }
# Sun.all.each_cons(2) { |a, b| three = a.compat_signs, b.sign }
#
# compatibilities = Sun.all.each_cons(2) { |a, b|
#   a.compat_signs.include?(b.sign) }
#
# compatibilities.each { |compatibility| Compatibility.create!(compatibility)}
#
# Sun.all.each_cons(2) do |sun_a, sun_b|
#   if sun_a.compat_signs.include?(sun_b.sign)
#     Compatibility.create!(sun_id: sun_a.id, compatible_sun_id: sun_b.id)
#   end
# end
#
# coms = Sun.all.each_cons(2) { |a, b| a.compat_signs.include?(b.sign) }
#
# # Sun.all.each_cons(2) { |a, b| p a.compat_signs, b.sign } all strings
#
#  comps = Sun.all.each_cons(2) { |a, b| p a.compat_signs, b.sign }
#
# foo = Sun.all.each_cons(2) { |a, b| [a.compat_signs, b.sign] }
#
# Sun.all.each_cons(2) { |a, b| bar = a.compat_signs, b.sign }
# # what am i trying to do:
# #   for one sun, check if the name exists in the other sun's
# #   compatibility key (iterate down a level)
# #   if it does, create a match and associate one sun give
# #   compatibility a sun_id and the other sun gives
# #   compatibility a compatible_sun_id (probably need to use
# #   zodiacs already created because they have the correct ids
# #   alreay in active record as opposed to the api hash)
#
# Sun.all.each_cons(2) { |a, b| p compat_signs = [a.compat_signs], sign = b.sign }
#
# Sun.all.each_cons(2) do |a, b|
#   return compat_signs = [a.compat_signs], sign = b.sign
# end
#
# Sun.all.each_cons(2) { |a, b| p bar = [a.compat_signs],
#   baz = b.sign }
#
def com_create(sun_one, sun_two)
  if sun_one.compat_signs.include?(sun_two.sign)
    Compatibility.find_or_create_by!(sun_id: sun_one.id, compatible_sun_id: sun_two.id)
  end
end
#
#   # def create_compatibilities(sun_one, sun_two)
#     # if sun_one.compatibility.includes
#     # def compatible(sun)
#     #   if self.compat_signs.include?(sun.sign)
#     # end
#   # end
# #   suns_array.each do |hash|
# #     hash[:compatibility]
# #
# # suns_array.map { |sun| sun["compatibility"] }
# # Compatibility.create!(sun_id, compatible_sun_id)

def get_suns
  Sun.all.each_cons(2) do |a, b|
    return sun_one = a, sun_two = b
  end
  return sun_one, sun_two
end
