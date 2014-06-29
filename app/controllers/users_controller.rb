class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @meals = @user.meals.order(created_at: :desc)
    @meal = @meals.first
    # @last_meal = @user.meals.last || nil
  end

end
