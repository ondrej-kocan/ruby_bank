require 'spec_helper'
require 'rails_helper'

RSpec.describe Customer, type: :model do

  it 'has a valid factory' do
    FactoryGirl.create(:customer).should be_valid
  end

  it 'is invalid without a username' do
    FactoryGirl.build(:customer, username: nil).should_not be_valid
  end

  it 'is invalid with empty username' do
    FactoryGirl.build(:customer, username: '').should_not be_valid
  end

  it 'is invalid with short username' do
    FactoryGirl.build(:customer, username: '0' * 3).should_not be_valid
  end

  it 'is invalid with long username' do
    FactoryGirl.build(:customer, username: '0' * 26).should_not be_valid
  end

  it 'needs to have a unique username' do
    first = FactoryGirl.create(:customer)
    first.save

    second = FactoryGirl.build(:customer, username: first.username)

    first.should be_valid
    second.should_not be_valid
  end

end
