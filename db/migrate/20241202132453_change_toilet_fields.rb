class ChangeToiletFields < ActiveRecord::Migration[7.1]
  def change
    change_column :reviews, :clean, :boolean, using: "clean::boolean"
    change_column :reviews, :dirty, :boolean, using: "dirty::boolean"
    change_column :reviews, :accessible, :boolean, using: "accessible::boolean"
    change_column :reviews, :paid_entry, :boolean, using: "paid_entry::boolean"
    change_column :reviews, :female_friendly, :boolean, using: "female_friendly::boolean"
    change_column :reviews, :well_located, :boolean, using: "well_located::boolean"
    add_column :reviews, :handicap_friendly, :boolean, using: "handicap_friendly::boolean"
    add_column :reviews, :family_friendly, :boolean, using: "family_friendly::boolean"
  end
end
