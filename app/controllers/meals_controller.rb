class MealsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  # Should not rescue all errors, favor letting rails handle bad routes
  def show
    @meal = Meal.find(params[:id])
  end

  def new
    @meal = Meal.new
    @goals = Goal.all
  end

  def create
    meal = Meal.create(meal_params)
    current_user.meals << meal
    data = Meal.check_nutritional_facts(params[:meal][:ingredients])
    meal.update(
      ingredients: params[  :meal][:ingredients],
      calories: data["energy"], fat: data["total fat"],
      protein: data["proteins"],
      fiber: data["total fibres"],
      sugar: data["sugar"],
      sodium: data["sodium"],
      carbs: data["total carbs"]
      )
    redirect_to meal
  end

  def grab_meals
    return_data = []

    meals = Meal.all.where.not(user_id: current_user.id)
    meals.each do |meal|
      if meal.ratings.where(user_id: current_user.id).size <= 0
        return_data << [meal, meal.meal_photo.url(:medium), meal.goal.name]
      end
    end

    respond_to do |format|
      format.json { render json: return_data}
    end
  end

  private
  def meal_params
    params.require(:meal).permit(:meal_photo, :comment, :ingredients, :goal_id)
  end

end
