# In order to add user a credit using console, you need to do the following:
#
# irb(main):035:0* a = Customer.find_by(:username => 'ondrej_kocan').account
#   Customer Load (0.2ms)  SELECT  "customers".* FROM "customers"  WHERE "customers"."username" = 'ondrej_kocan' LIMIT 1
#   Account Load (0.2ms)  SELECT  "accounts".* FROM "accounts"  WHERE "accounts"."customer_id" = ? LIMIT 1  [["customer_id", 2]]
# => #<Account id: 1, created_at: "2015-07-26 10:06:53", updated_at: "2015-07-26 10:06:53", balance: #<BigDecimal:7fbd695b83c0,'0.0',9(36)>, customer_id: 2>
#
# irb(main):044:0* a.balance += 40.0
# => #<BigDecimal:7fbd695fb170,'0.4E2',9(27)>
#
# irb(main):055:0* a.save
#    (0.1ms)  begin transaction
#   SQL (0.5ms)  UPDATE "accounts" SET "balance" = ?, "updated_at" = ? WHERE "accounts"."id" = 1  [["balance", 40.0], ["updated_at", "2015-07-26 10:12:14.736229"]]
#    (9.0ms)  commit transaction
# => true
#
class Account < ActiveRecord::Base

  validates_numericality_of :balance, :greater_than_or_equal_to => 0

  belongs_to :customer

  def debit(amount)
    self.balance -= amount
    save
  end

  def credit(amount)
    self.balance += amount
    save
  end

end
