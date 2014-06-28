class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :title
      t.datetime :time_start
      t.datetime :time_stop

      t.timestamps
    end
  end
end
