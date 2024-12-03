class AddUserIdToToilets < ActiveRecord::Migration[6.0]
  def change
    unless column_exists?(:toilets, :user_id)
      add_reference :toilets, :user, null: false, foreign_key: true
    end
  end
end
