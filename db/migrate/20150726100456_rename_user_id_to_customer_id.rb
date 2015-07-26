class RenameUserIdToCustomerId < ActiveRecord::Migration
  def change
    rename_column :accounts, :user_id, :customer_id
  end
end
