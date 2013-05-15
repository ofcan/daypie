require 'spec_helper'

describe User do
  let!(:user) { FactoryGirl.build :user }

  it 'creates new user' do
    user.should be_valid
  end
  it 'responds to email' do
    user.should respond_to(:email)
  end
  it 'responds to password' do
    user.should respond_to(:password)
  end

end
