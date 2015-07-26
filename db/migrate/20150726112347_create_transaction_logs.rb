class CreateTransactionLogs < ActiveRecord::Migration
  def change
    create_table :transaction_logs do |t|
      t.integer :source_id
      t.decimal :source_balance_after
      t.integer :target_id
      t.decimal :target_balance_after
      t.decimal :amount

      t.timestamps
    end
  end
end
