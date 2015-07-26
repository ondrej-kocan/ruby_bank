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
#    (0.2ms)  begin transaction
#   Customer Exists (0.6ms)  SELECT  1 AS one FROM "customers"  WHERE LOWER("customers"."username") = LOWER('ondrej_kocan') LIMIT 1
# Binary data inserted for `string` type on column `password_digest`
#   SQL (1.1ms)  INSERT INTO "customers" ("created_at", "password_digest", "updated_at", "username") VALUES (?, ?, ?, ?)  [["created_at", "2015-07-26 08:08:03.431686"], ["password_digest", "$2a$10$XBCF9r9YRvu0Ug5ZsR2ikuqpF/b7i9eGjLUPYH5Mx3YbTlCkq/HVu"], ["updated_at", "2015-07-26 08:08:03.431686"], ["username", "ondrej_kocan"]]
#    (1.4ms)  commit transaction
# => true
#
class Customer < ActiveRecord::Base

  has_secure_password

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 4, maximum: 25}

end
