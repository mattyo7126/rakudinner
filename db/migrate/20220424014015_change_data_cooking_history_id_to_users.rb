class ChangeDataCookingHistoryIdToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :cooking_history_id, :text
  end
end
