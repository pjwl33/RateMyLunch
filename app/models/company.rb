class Company < ActiveRecord::Base
  has_many :users
  has_many :meals

  def meals_since_sunday
    tonight = DateTime.now.change(hour: 23, min: 59)
    last_sunday_night = tonight - tonight.wday
    self.meals.select { |m| m.created_at > last_sunday_night }
  end
end
