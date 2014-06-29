class RatingsController < ApplicationController

  before_action :authenticate_user!

  def index
    # Leaderboard
    current_company = current_user.company
    @grouped_meals = current_company.meals_since_sunday.group_by { |m| m.goal }
  end

	def create
		@user = current_user
		@meal = Meal.find(params[:id])
		@rating = Rating.create(user: @user, meal: @meal, vote_rating: params[:vote_rating])
			respond_to do |format|
        format.html { }
        format.json { render json: @rating.to_json }
        format.js   { }
      end
	end

	def update
	end

	def destroy
	end

	private

end
