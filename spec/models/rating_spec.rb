require_relative '../spec_helper.rb'


describe Rating do

	describe "#create" do
		it "should be able to create a rating" do
			@stephen = User.find_by(name: 'Stephen Marsh')
			@jesse = User.find_by(name: 'Jesse Sessler')
			@stephen_meal = Meal.create(user: @stephen, comment: "first meal")
			@jesse_rating = Rating.create(user: @jesse, meal: @stephen_meal, vote_rating: 5)
			expect(@jesse_rating.vote_rating).to eq(5)
		end
		it "should not let you vote twice for the same meal" do 
			@stephen = User.find_by(name: 'Stephen Marsh')
			@jesse = User.find_by(name: 'Jesse Sessler')
			@stephen_meal = Meal.create(user: @stephen, comment: "first meal")
			@jesse_rating = Rating.create(user: @jesse, meal: @stephen_meal, vote_rating: 5)
			expect(@jesse_rating.vote_rating).to eq(5)
			@second_rating = Rating.create(user: @jesse, meal: @stephen_meal, vote_rating: 4)
			expect(@second_rating.id).to be(nil)
			expect(@jesse.ratings.length).to eq(1)
			expect(@jesse_rating.vote_rating).to eq(5)
		end
		it "should persist the rating score to the meal table" do
			@stephen = User.find_by(name: 'Stephen Marsh')
			@jesse = User.find_by(name: 'Jesse Sessler')
			@jason = User.find_by(name: 'Jason Leibowitz')
			@paul = User.find_by(name: 'Paul Lee')
			@alex = User.find_by(name: 'Alexandra Shook')

			@stephen_meal = Meal.create(user: @stephen, comment: "first meal")
			# @stephen_meal.reload
			expect(@stephen_meal.ratings.length).to eq(0)
			expect(@stephen_meal.rating).to eq(nil)

			@jesse_rating = Rating.create(user: @jesse, meal: @stephen_meal, vote_rating: 5)
			@stephen_meal.ratings.reload
			# @jesse_rating.update_meal_rating
			expect(@stephen_meal.rating).to eq(5)
			
			@jason_rating = Rating.create(user: @jason, meal: @stephen_meal, vote_rating: 4)
			@stephen_meal.ratings.reload
			# @jason_rating.update_meal_rating
			expect(@stephen_meal.rating).to eq(4.5)

			@paul_rating = Rating.create(user: @paul, meal: @stephen_meal, vote_rating: 3)
			# @paul_rating.update_meal_rating
			expect(@stephen_meal.rating).to eq(4)

			@alex_rating = Rating.create(user: @alex, meal: @stephen_meal, vote_rating: 2)
			# @alex_rating.update_meal_rating
			expect(@stephen_meal.rating).to eq(3.5)

			@alex_rating.destroy
			expect(@stephen_meal.rating).to eq(4)

			# @stephen_meal.reload
			@paul_rating.update!(vote_rating: 5)
			@jason_rating.update!(vote_rating: 5)
			# @stephen_meal.reload
			expect(@stephen_meal.rating).to eq(5)

		end
	end
	
end