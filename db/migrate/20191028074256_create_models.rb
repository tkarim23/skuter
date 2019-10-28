class CreateModels < ActiveRecord::Migration[6.0]
  def change
    create_table :models do |t|
      t.string :brand
      t.string :name
      t.integer :cc
      t.string :fuel
      t.integer :weight
      t.string :size

      t.timestamps
    end
  end
end
