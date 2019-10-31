class AddAvailabilityToScooters < ActiveRecord::Migration[6.0]
  def change
    add_column :scooters, :availability, :boolean
  end
end
