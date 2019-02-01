class Compatibility < ApplicationRecord
  belongs_to :sun
  belongs_to :compatible_sun, class_name: "Sun"
end
