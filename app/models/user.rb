class User < ApplicationRecord
  belongs_to :sun
  before_validation :find_sun_sign
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_day, presence: true
  has_many :matches, dependent: :destroy
  has_many :matched_users, through: :matches
  has_many :user_matches, class_name: "Match", foreign_key: "matched_user_id"
  has_many :users_matched, through: :user_matches, source: :user


  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def dob
    bday = Date.new(("#{self.birth_year}").to_i, ("#{self.birth_month}").to_i, ("#{self.birth_day}").to_i)
    # return bday = Date.new(("#{self.birth_year}").to_i, ("#{self.birth_month}").to_i, ("#{self.birth_day}").to_i)
  end

# h = User.first
# e = User.second
# d = User.third
# b = User.fourth
# a = User.fifth
# j = User.find(6)

def my_sun_compats
  compat_sun_ids = self.sun.compatible_suns.map { |compat_sun| compat_sun.id }
  compat_sun_ids.push(self.sun_id)
  User.all.find_all do |user|
    if compat_sun_ids.include?(user.sun_id) && (user.id != self.id)
      Match.find_or_create_by!(user_id: self.id, matched_user_id: user.id)
    end
  end
end


  private

    def find_sun_sign
      Sun.all.find do |sun|
        if self.dob.zodiac_sign == sun.sign
          self.sun = sun
        end
      end
    end

    # def BEFORE_SAVE
    #   We use before_save for actions that need to occur that  aren't modifying the model itself. For  example, whenever you save to the database,   let's send an email to the Author alerting  them that the post was just saved!
    #   i.e. ALERTING A USER ABOUT A SUCCESSFUL MATCH
    # end

    # def sun(dob)
    #   zodiac = dob.zodiac_sign
    # end
    # def sun(@user.dob)
    #   zodiac = dob.zodiac_sign
    # end

  # def find_sun_sign
  #   user_bday = Chronic.parse(combine_bday)
  #   Sun.all.each do |sun|
  #     start_date = Chronic.parse(sun.start_date)
  #     end_date = Chronic.parse(sun.end_date)
  #     if user_bday.between?(start_date, end_date)
  #       self.sun = sun
  #     end
  #   end
  # end

end
