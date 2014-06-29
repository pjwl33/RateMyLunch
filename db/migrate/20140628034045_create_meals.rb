class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :comment
      t.string :ingredients
      t.integer :calories
      t.integer :fat
      t.integer :protein
      t.integer :fiber
      t.integer :sugar
      t.integer :sodium
      t.integer :carbs
      t.float :rating
      t.references :user
      t.references :goal
      t.references :company

      t.timestamps
    end
  end
end
