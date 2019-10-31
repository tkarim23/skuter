class SetDefaultForAvailabilityToScooters < ActiveRecord::Migration[6.0]
  def change
    change_column_default :scooters, :availability, true
  end
end
