class CreateToilets < ActiveRecord::Migration[7.1]
  def change
    create_table :toilets do |t|
      t.string :location
      t.string :category
      t.boolean :avaliable
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
