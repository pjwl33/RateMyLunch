class CreateLunches < ActiveRecord::Migration
  def change
    create_table :lunches do |t|
      t.string :comment
      t.string :ingredients
      t.integer :calories
      t.integer :fat
      t.integer :protein
      t.integer :fiber
      t.integer :sugar
      t.integer :sodium

      t.timestamps
    end
  end
end
