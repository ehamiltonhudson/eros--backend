class Sun < ApplicationRecord
  has_many :users
  has_many :compatibilities, dependent: :destroy
  has_many :compatible_suns, through: :compatibilities
  has_many :inverse_compatibilities, class_name: "Compatibility", foreign_key: "compatible_sun_id"
  has_many :inverse_compatible_suns, through: :inverse_compatibilities, source: :sun
  
  # after_create :update_pisces, before: :save
  # before_save :update_pisces, on: :create
  # before_save { Sun.all.find { |sun| sun.sign == "Pisces" ? sun[:compat_signs][0] = "Taurus, Cancer, Scorpio, Capricorn" : nil }}

  # def remove_whitespace
  #   compat_signs_array = self.compat_signs.split(',')
  #   return compat_signs_array.map { |item| item.strip }.split(', ')
  # end

  def self.class_compat_signs_array
    big_array = self.all.map do |sun|
      sun.compat_signs
      # sun_string = "#{sun.sign}" + " compats are " + "#{sun.compat_signs}"
    end
    each_array = big_array.each.map { |elem| elem.split(',') }
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

# private
  #
  # def self.update_pisces(sun)
  #   # Sun.all.find do |sun|
  #   #   pisces = sun.sign == "Pisces
  #   if sun.id == 12
  #     sun.compat_signs = ["Taurus", "Cancer", "Scorpio", "Capricorn"]
  #   byebug
  # end

end
