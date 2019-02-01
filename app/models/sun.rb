class Sun < ApplicationRecord
  has_many :users
  has_many :compatibilities
  has_many :compatible_suns, through: :compatibilities
  has_many :inverse_compatibilities, class_name: "Compatibility", foreign_key: "compatible_sun_id"
  has_many :inverse_compatible_suns, through: :inverse_compatibilities, source: :sun

  # @aries = Sun.first
  # @taurus = Sun.second
  # @gemini = Sun.third
  # @cancer = Sun.fourth
  # @leo = Sun.fifth
  #
  # aries = Sun.first
  # leo = Sun.fifth
  #
  # aries_arr = aries.compat_signs_to_array
  # leo_arr = leo.compat_signs_to_array
  #
  aries_arr.map_compat_signs(leo, leo_arr)
  # leo_arr.map_compat_signs(aries, aries_arr)
  # Sun.class_compat_signs_array

  def self.class_compat_signs_array
    big_array = self.all.map do |sun|
      sun.compat_signs
      # sun_string = "#{sun.sign}" + " compats are " + "#{sun.compat_signs}"
    end
    array = big_array.each.map { |elem| elem.split(',') }
  end
  # ^ returns array of arrays each signs compat_signs

  def compat_signs_to_array
    return compat_signs_array = self.compat_signs.split(',')
  end
  # convert sun instance compat_signs attriute from string to array

  def compatible(sun)
    if self.compat_signs.include?(sun.sign)
      return "yes, compatible with #{sun.sign}"
    end
  end
  # find compatibility between two sun instances

  def map_compat_signs(sun, arr)
    arr.select do |a|
      self.compat_signs.include?(a)
    end
  end
  # returns crossover compatibility signs between two instances

  def select(sun, arr)
    arr.select do |a|
      self.compat_signs.include?(a)
    end
  end 
  # ^^ works in rails console:
  # leo.select(aries, aries_arr)
  # => [" Sagittarius", " Gemini"]

end
