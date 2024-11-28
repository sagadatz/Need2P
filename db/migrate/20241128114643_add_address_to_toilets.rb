class AddAddressToToilets < ActiveRecord::Migration[7.1]
  def change
    add_column :toilets, :address, :string
  end
end
