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
  it 'responds to username' do
    user.should respond_to(:username)
  end
  it 'doesnt create new user if username blank' do
    user.username = ''
    user.should_not be_valid
  end
end
