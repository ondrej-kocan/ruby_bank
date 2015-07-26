class Account < ActiveRecord::Base

  validates_numericality_of :balance, :greater_than_or_equal_to => 0

  belongs_to :customer

end
