class Compatibility < ApplicationRecord
  belongs_to :sun
  belongs_to :compatible_sun, class_name: "Sun"
  validates_uniqueness_of :compatible_sun, scope: :sun

end
