class MealsController < ApplicationController

  def show
    @meal = Meal.find(params[:id])
  end

  def new
    @meal = Meal.new
    @goals = Goal.all
  end

  def create
    data = Meal.check_nutritional_facts(params[:meal][:ingredients])
    @meal = Meal.create(
      ingredients: params[:meal][:ingredients],
      comment: params[:meal][:comment],
      calories: data["energy"], fat: data["total fat"],
      protein: data["proteins"],
      fiber: data["total fibres"],
      sugar: data["sugar"],
      sodium: data["sodium"],
      carbs: data["total carbs"]
      )
    redirect_to @meal
  end

end
