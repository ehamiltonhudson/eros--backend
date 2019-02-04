class Compatibility < ApplicationRecord
  belongs_to :sun
  belongs_to :compatible_sun, class_name: "Sun"
  # validates :sun_id, presence: true
  # validates :compatible_sun_id, presence: true
  validates_uniqueness_of :compatible_sun, scope: :sun
end
