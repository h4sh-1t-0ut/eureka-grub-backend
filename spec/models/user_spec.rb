require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with an email and password' do
    user = User.new(
      email: 'user@example.com',
      password: 'password123'
    )
    expect(user).to be_valid
  end

  it 'is invalid without an email' do
    user = User.new(email: nil, password: 'password123')
    expect(user).not_to be_valid
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'is invalid without a password' do
    user = User.new(email: 'user@example.com', password: nil)
    expect(user).not_to be_valid
    expect(user.errors[:password]).to include("can't be blank")
  end

  # Add other model tests here...
end
