class SunSerializer < ActiveModel::Serializer
  has_many :users
  attributes :id, :start_date, :end_date
end
