require 'spec_helper'

describe Pie do
  let!(:pie) { FactoryGirl.build :pie }

  it 'creates new pie' do
    pie.should be_valid
  end
  it 'responds to name' do
    pie.should respond_to(:name)
  end
  it 'responds to description' do
    pie.should respond_to(:description)
  end
  it 'responds to user' do
    pie.should respond_to(:user)
  end
  it 'doesnt create new pie if piename blank' do
    pie.name = ''
    pie.should_not be_valid
  end
end
