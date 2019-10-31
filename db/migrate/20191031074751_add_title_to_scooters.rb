class AddTitleToScooters < ActiveRecord::Migration[6.0]
  def change
    add_column :scooters, :title, :text
  end
end
