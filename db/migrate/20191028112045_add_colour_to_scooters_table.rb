class AddColourToScootersTable < ActiveRecord::Migration[6.0]
  def change
    add_column :scooters, :colour, :string
  end
end
