class AddPhotoUrlToModels < ActiveRecord::Migration[6.0]
  def change
    add_column :models, :photo_url, :string
  end
end
