require 'spec_helper'
require 'rails_helper'

RSpec.describe Customer, type: :model do

  it 'has a valid factory' do
    expect(FactoryGirl.create(:customer)).to be_valid
  end

  it 'is invalid without a username' do
    expect(FactoryGirl.build(:customer, username: nil)).not_to be_valid
  end

  it 'is invalid with empty username' do
    expect(FactoryGirl.build(:customer, username: '')).not_to be_valid
  end

  it 'is invalid with short username' do
    expect(FactoryGirl.build(:customer, username: '0' * 3)).not_to be_valid
    expect(FactoryGirl.build(:customer, username: '0' * 4)).to be_valid
  end

  it 'is invalid with long username' do
    expect(FactoryGirl.build(:customer, username: '0' * 26)).not_to be_valid
    expect(FactoryGirl.build(:customer, username: '1' * 25)).to be_valid
  end

  it 'needs to have a unique username' do
    first = FactoryGirl.create(:customer)
    first.save

    second = FactoryGirl.build(:customer, username: first.username)

    expect(first).to be_valid
    expect(second).not_to be_valid
  end

  it 'is invalid without a password' do
    customer = FactoryGirl.create(:customer)
    customer.password_digest = nil
    expect(customer).not_to be_valid
  end

  it 'is invalid with empty password' do
    customer = FactoryGirl.create(:customer)
    customer.password_digest = ''
    expect(customer).not_to be_valid
  end

end
