class Customer < ActiveRecord::Base

  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {minimum: 4, maximum: 25}

end
