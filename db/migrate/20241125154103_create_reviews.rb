class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.integer :rating
      t.references :user, null: false, foreign_key: true
      t.references :toilet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
