class AddHandicapFriendlyToToilets < ActiveRecord::Migration[7.1]
  def change
    add_column :toilets, :handicap_friendly, :boolean
  end
end
