class MealsController < ApplicationController

  def show
    @meal = Meal.find(params[:id])
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.create(meals_params)
    if @meal.valid?
      redirect_to @meal
    end
  end

  private
  def meals_params
    return params.require(:meal).permit(:comment, :ingredients, :calories, :fat, :protein, :fiber, :sugar, :sodium, :carbs)
  end

end
