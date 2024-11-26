class CreateToilets < ActiveRecord::Migration[7.1]
  def change
    create_table :toilets do |t|
      t.string :location
      t.boolean :available
      t.float :longitude
      t.float :latitude
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
