class AddDescriptionToModels < ActiveRecord::Migration[6.0]
  def change
    add_column :models, :description, :text
  end
end
