class FixNutritionInMeals < ActiveRecord::Migration
  def change
    change_column :meals, :calories, :float
    change_column :meals, :fat, :float
    change_column :meals, :protein, :float
    change_column :meals, :fiber, :float
    change_column :meals, :sugar, :float
    change_column :meals, :sodium, :float
    change_column :meals, :carbs, :float
  end
end
