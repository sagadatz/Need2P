class AddHandicapFriendlyToToilets < ActiveRecord::Migration[7.1]
  def change
    add_column :toilets, :handicap_friendly, :boolean, default: false
  end
end 
