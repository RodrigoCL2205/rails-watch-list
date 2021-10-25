class AddPhotoUrlToLists < ActiveRecord::Migration[6.0]
  def change
    add_column :lists, :photo_url, :string
  end
end
