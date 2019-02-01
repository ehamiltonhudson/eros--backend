class User < ApplicationRecord
  belongs_to :sun
  before_validation :find_sun_sign
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
