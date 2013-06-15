require 'spec_helper.rb'

describe 'Pies' do

  let!(:user) { create :user }
  let!(:pie) { create :pie }
  let!(:valid_attributes) { attributes_for :pie }

  context 'success' do

    it 'should get to new pie page' do
      visit root_path
      click_link 'new_pie'
      current_path.should == new_user_session_path
      fill_in 'user_email', :with => user.email
      fill_in 'user_password', :with => user.password
      click_button 'Sign in'
      pending 'current_path.should == new_pie_path'
    end

    it 'should get to new pie page if the user is signed in' do
      sign_in_as!(user)
      visit root_path
      click_link 'new_pie'
      current_path.should == new_pie_path
    end

    it 'should create new pie' do
      sign_in_as!(user)
      visit new_pie_path
      fill_in 'pie_name', :with => valid_attributes[:name]
      fill_in 'pie_description', :with => valid_attributes[:description]
      expect {
        click_button 'Create Pie'
      }.to change(Pie, :count).by(1)
    end

    it 'should get to edit pie page' do
      sign_in_as!(pie.user)
      visit pie_path(pie)
      click_link "edit_pie_#{pie.id}"
      current_path.should == edit_pie_path(pie)
    end

    it 'should re-bake the pie' do
      sign_in_as!(pie.user)
      visit edit_pie_path(pie)
      fill_in 'pie_name', :with => valid_attributes[:name]
      fill_in 'pie_description', :with => valid_attributes[:description]
      click_button 'Update Pie'
      current_path.should == pie_path(pie)
      page.should have_content 'Pie re-baked.'
    end

    it 'should destroy the pie' do
      sign_in_as!(pie.user)
      visit pie_path(pie)
      click_link "destroy_pie_#{pie.id}"
      current_path.should == root_path
    end

  end

  context 'failure' do
  end

end
