class Compatibility < ApplicationRecord
  belongs_to :sun
  belongs_to :compatible_sun, class_name: "Sun"
  # before_validation :create_compatibility
  # validate :no_duplicate_compatibility
  #
  # def no_duplicate_compatibility
  #   combinations = ["sun_id = #{sun_id} AND compatible_sun_id = #{compatible_sun_id}", "sun_id = #{compatible_sun_id} AND compatible_sun_id = #{sun_id}"]
  #   if Sun.where(combinations.join(' OR ')).exists?
  #     self.errors.add(:sun_id, 'Compatibility already exists')
  #   end
  # end
  #
  # def create_compatibility
  #   # @sun = Sun.find(sun_id)
  #   compatible_sun = Sun.find(compatible_sun_id)
  #   unless compatible_sun.compatible_suns.include?(sun)
  #     Sun.find(compatible_sun_id).compatible_suns << sun
  #   # if sun.compat_signs.include?(compatible_sun.sign)
  #   #   @compatibility = Compatibility.create(sun_id:sun.id, compatible_sun_id: compatible_sun.id)
  #   end
  # end

end
