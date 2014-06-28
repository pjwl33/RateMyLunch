class Rating < ActiveRecord::Base

	belongs_to :user
	belongs_to :meal

	validate :check_for_duplicates, :on => :create
	# before_create :check_for_duplicates
	after_save :update_meal_rating
	after_update :update_meal_rating
	after_destroy :update_meal_rating

	def update_meal_rating
		self.meal.ratings.reload
		total_ratings = self.meal.ratings.length
		if total_ratings == 1
			self.meal.rating = self.vote_rating.to_f
		else
			total_score = 0.0
			self.meal.ratings.each do |rating|
				total_score += rating.vote_rating
			end
			self.meal.rating = (total_score.to_f / total_ratings.to_f)
		end
	end

	private

	def check_for_duplicates
		meal = self.meal
		ratings = meal.ratings
		user = self.user
		ratings.each do |rating|
			if rating.user == user
			errors.add(:unique_vote, "Already voted")
			end
		end
	end

end
