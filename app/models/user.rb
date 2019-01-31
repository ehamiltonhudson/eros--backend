class User < ApplicationRecord
  belongs_to :sun
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_day, presence: true


  def dob
    bday = Date.new(("#{self.birth_year}").to_i, ("#{self.birth_month}").to_i, ("#{self.birth_day}").to_i)
    # return bday = Date.new(("#{self.birth_year}").to_i, ("#{self.birth_month}").to_i, ("#{self.birth_day}").to_i)
  end

  # def sun(dob)
  #   zodiac = dob.zodiac_sign
  # end
  # def sun(@user.dob)
  #   zodiac = dob.zodiac_sign
  # end

end
