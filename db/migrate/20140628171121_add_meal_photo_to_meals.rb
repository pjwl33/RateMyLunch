class AddMealPhotoToMeals < ActiveRecord::Migration
  def self.up
    add_attachment :meals, :meal_photo
  end

  def self.down
    remove_attachment :meals, :meal_photo
  end
end
