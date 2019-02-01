class UserSerializer < ActiveModel::Serializer
  belongs_to :sun
  attributes :id, :first_name, :last_name, :birth_year, :birth_month, :birth_day
end
