class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.integer :zip
      t.string :city
      t.string :state
      t.string :url
      t.integer :phone
      t.string :hours

      t.timestamps
    end
  end
end
