class Company < ActiveRecord::Base
  has_many :users
  has_many :meals

  def meals_since_sunday
    last_sunday_night = Date.today.beginning_of_week(:monday).to_datetime.change(hour: 1)
    self.meals.select { |m| m.created_at > last_sunday_night }
  end
end
