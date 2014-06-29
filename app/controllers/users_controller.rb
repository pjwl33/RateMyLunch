class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @meals = @user.meals_since_sunday
    @meal = @meals.shift
		@company_meals = @user.company.meals_since_sunday_sorted
  end

end
