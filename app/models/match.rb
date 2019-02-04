class Match < ApplicationRecord
  belongs_to :user
  belongs_to :matched_user, class_name: "User"
  # validates :user_id, presence: true
  # validates :matched_user_id, presence: true
  validates_uniqueness_of :matched_user, scope: :user
end
