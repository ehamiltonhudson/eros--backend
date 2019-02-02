class Sun < ApplicationRecord
  has_many :users
  has_many :compatibilities, dependent: :destroy
  has_many :compatible_suns, through: :compatibilities
  has_many :inverse_compatibilities, class_name: "Compatibility", foreign_key: "compatible_sun_id"
  has_many :inverse_compatible_suns, through: :inverse_compatibilities, source: :sun
  validate :no_duplicate_compatibility

  # @aries = Sun.first
  # @taurus = Sun.second
  # @gemini = Sun.third
  # @cancer = Sun.fourth
  # @leo = Sun.fifth
  #
  # aries = Sun.first
  # leo = Sun.fifth
  # aries_arr = aries.compat_signs_to_array
  # leo_arr = leo.compat_signs_to_array
  #
  # aries.compatible(leo)
  # leo.compatible(aries)
  #
  # aries.find_mutual_compats(leo, leo_arr)
  # leo.find_mutual_compats(aries, aries_arr)
  # Sun.class_compat_signs_array

  def self.class_compat_signs_array
    big_array = self.all.map do |sun|
      sun.compat_signs
      # sun_string = "#{sun.sign}" + " compats are " + "#{sun.compat_signs}"
    end
    array = big_array.each.map { |elem| elem.split(',') }
  end
  # ^^ returns array of arrays each signs compat_signs

  def compat_signs_to_array
    compat_signs_array = self.compat_signs.split(',')
    return compat_signs_array.map { |item| item.strip }
  end
  # ^^ convert sun instance compat_signs attriute from string to array

  def compatible(sun)
    if self.compat_signs.include?(sun.sign)
      return "yes, #{self.sign} is compatible with #{sun.sign}"
    end
  end
  # ^^ determines compatibility between two sun instances
  # (finds whether or not they exist in each other's compat_signs)

  def find_mutual_compats(sun, arr)
    arr.select do |el|
      self.compat_signs.include?(el)
    end
  end
  # ^^ returns crossover compatibility signs between two instances

  def com_create(sun_one, sun_two)
    if sun_one.compat_signs.include?(sun_two.sign)
      Compatibility.create(sun_id: sun_one.id, compatible_sun_id: sun_two.id)
      bye_bug
    end
  end

  def create_com
    @sun = sun.find(sun.id)
    @compatible_sun = sun.find(compatible_sun.id)
    if @sun.compat_signs.include?(@compatible_sun.sign)
      Compatibility.create(sun_id: @sun.id, compatible_sun_id: @compatible_sun.id)
    else
      puts "not compatible"
    end
  end


  # suns.each_cons(2) { |a, b| p com_create(a, b) }
  #
  # suns.each_cons(2) { |a, b| p sun_one = a, sun_two = b }

end
