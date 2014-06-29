class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @meals = @user.meals_since_sunday
    @meal = @meals.shift
    # @last_meal = @user.meals.last || nil
  end

end
