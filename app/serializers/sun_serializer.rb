class SunSerializer < ActiveModel::Serializer
  has_many :users
  attributes :id, :sign, :start_date, :end_date, :compat_signs
end
