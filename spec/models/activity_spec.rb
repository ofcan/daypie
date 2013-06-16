require 'spec_helper'

describe Activity do
  let!(:activity) { FactoryGirl.build :activity }

  it 'creates new activity' do
    activity.should be_valid
  end
  it 'responds to title' do
    activity.should respond_to(:title)
  end
  it 'responds to description' do
    activity.should respond_to(:description)
  end
  it 'responds to from_time' do
    activity.should respond_to(:from_time)
  end
  it 'responds to until_time' do
    activity.should respond_to(:until_time)
  end

  it 'responds to pie' do
    activity.should respond_to(:pie)
  end
  it 'responds to user' do
    activity.should respond_to(:user)
  end

  it 'doesnt create new activity if title blank' do
    activity.title = ''
    activity.should_not be_valid
  end
  it 'doesnt create new activity if from_time blank' do
    activity.from_time = nil
    activity.should_not be_valid
  end
  it 'doesnt create new activity if until_time blank' do
    activity.until_time = nil
    activity.should_not be_valid
  end
  
end
