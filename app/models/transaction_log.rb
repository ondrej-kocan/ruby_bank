class TransactionLog < ActiveRecord::Base

  belongs_to :source, foreign_key: 'source_id', class_name: Account
  belongs_to :target, foreign_key: 'target_id', class_name: Account

end
