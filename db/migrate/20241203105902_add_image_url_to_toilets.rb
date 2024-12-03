class AddImageUrlToToilets < ActiveRecord::Migration[7.1]
  def change
    add_column :toilets, :image_url, :string
  end
end
