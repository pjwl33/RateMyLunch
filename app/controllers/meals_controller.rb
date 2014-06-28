class MealsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def show
    @meal = Meal.find(params[:id])
  end

  def new
    @goals = Goal.all
    @meal = Meal.new
  end

  def create
    meal = Meal.create(meal_params)
    current_user.meals << meal
    redirect_to meal
  end

  private

  def meal_params
    params.require(:meal).permit(:meal_photo, :comment, :ingredients, :goal_id)
  end

end
