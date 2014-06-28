class RatingsController < ApplicationController

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
