class CreateScooters < ActiveRecord::Migration[6.0]
  def change
    create_table :scooters do |t|
      t.references :model, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :location
      t.integer :age
      t.integer :mileage
      t.string :condition
      t.string :photo
      t.integer :price_per_day

      t.timestamps
    end
  end
end
