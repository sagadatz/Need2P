class CreateToiletCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :toilet_categories do |t|
      t.references :toilet, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
