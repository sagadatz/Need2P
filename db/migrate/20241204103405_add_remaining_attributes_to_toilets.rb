class AddRemainingAttributesToToilets < ActiveRecord::Migration[7.1]
  def change
    add_column :toilets, :paid_entry, :boolean
    add_column :toilets, :well_located, :boolean
  end
end
