class AddFamilyFriendlyToToilets < ActiveRecord::Migration[7.1]
  def change
    add_column :toilets, :family_friendly, :boolean, default: false
  end
end
