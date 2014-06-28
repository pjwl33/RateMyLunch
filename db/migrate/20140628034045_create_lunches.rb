class CreateLunches < ActiveRecord::Migration
  def change
    create_table :lunches do |t|
      t.string :comment
      t.string :ingredients
      t.string :calories
      t.string :fat
      t.string :protein
      t.string :fiber

      t.timestamps
    end
  end
end
