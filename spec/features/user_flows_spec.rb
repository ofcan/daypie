require 'spec_helper.rb'

describe 'UserFlows' do

  before do
    @valid_attr = attributes_for :user
  end

  it 'should sign up the user given valid attributes' do
    expect {
      visit root_path
      click_link 'Sign up'
      current_path.should == new_user_registration_path
      fill_in 'user_username', :with => @valid_attr[:username]
      fill_in 'user_email', :with => @valid_attr[:email]
      fill_in 'user_password', :with => @valid_attr[:password]
      fill_in 'user_password_confirmation', :with => @valid_attr[:password]
      click_button 'Sign up'
      page.should have_content 'success'
    }.to change(User, :count).by(1)
  end
end
