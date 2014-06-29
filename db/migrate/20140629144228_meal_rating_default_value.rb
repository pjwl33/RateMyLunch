class MealRatingDefaultValue < ActiveRecord::Migration
  def change
    change_column :meals, :rating, :float, :default => 0
  end
end
