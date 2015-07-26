require 'rails_helper'

RSpec.describe Account, type: :model do

  it 'is invalid with a negative balance' do
    a = FactoryGirl.create(:account)
    a.balance *= -1
    expect(a).not_to be_valid
  end

end
