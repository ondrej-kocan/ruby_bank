class AddBalanceToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :balance, :decimal
  end
end
