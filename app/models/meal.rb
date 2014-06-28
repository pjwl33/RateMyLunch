class Meal < ActiveRecord::Base

	has_many :ratings
	belongs_to :user
	
end
