# In order to create a customer using console, you need to do something similar to the following:
#
# Virginia:ruby_bank ondrej$ rails c
#
# irb(main):006:0* c = Customer.new
# => #<Customer id: nil, username: nil, created_at: nil, updated_at: nil, password_digest: nil>
#
# irb(main):007:0> c.username = 'ondrej_kocan'
# => "ondrej_kocan"
#
# irb(main):008:0> c.password_digest = BCrypt::Password.create('password')
# => "$2a$10$XBCF9r9YRvu0Ug5ZsR2ikuqpF/b7i9eGjLUPYH5Mx3YbTlCkq/HVu"
#
# irb(main):018:0* c.save
#    (0.4ms)  begin transaction
#   Customer Exists (0.2ms)  SELECT  1 AS one FROM "customers"  WHERE LOWER("customers"."username") = LOWER('ondrej_kocan') LIMIT 1
# Binary data inserted for `string` type on column `password_digest`
#   SQL (0.4ms)  INSERT INTO "customers" ("created_at", "password_digest", "updated_at", "username") VALUES (?, ?, ?, ?)  [["created_at", "2015-07-26 10:06:53.782905"], ["password_digest", "$2a$10$LuIPwV8s6q8G6ZDbawADvOztLAzFaLBmlg1In976YAGoNwXuXzeeW"], ["updated_at", "2015-07-26 10:06:53.782905"], ["username", "ondrej_kocan"]]
#   SQL (0.1ms)  INSERT INTO "accounts" ("balance", "created_at", "customer_id", "updated_at") VALUES (?, ?, ?, ?)  [["balance", 0.0], ["created_at", "2015-07-26 10:06:53.853969"], ["customer_id", 2], ["updated_at", "2015-07-26 10:06:53.853969"]]
#    (0.8ms)  commit transaction
# => true
#
class Customer < ActiveRecord::Base

  has_secure_password

  before_create :create_account

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 4, maximum: 25}

  has_one :account

  private

    def create_account
      account = Account.new
      account.balance = 0
      account.customer = self
      self.account = account
    end

end
