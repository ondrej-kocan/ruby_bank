FactoryGirl.define do
  factory :customer do |f|
    f.username 'john_doe'
    f.password_digest BCrypt::Password.create('password')
    end
end
