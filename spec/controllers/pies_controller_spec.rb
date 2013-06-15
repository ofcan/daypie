require 'spec_helper'

describe PiesController do

let!(:pie) { create :pie }
let!(:user) { create :user }
let!(:valid_attributes) { attributes_for :pie }

  context 'success' do

    it 'should get index' do
      get :index
      response.should be_success
    end

    it 'should get show' do
      sign_in(user)
      get :show, :id => pie
      response.should be_success
    end

    it 'should create new pie' do
      sign_in(user)
      expect {
        post :create, :pie => valid_attributes
      }.to change(Pie, :count).by(1)
      response.should redirect_to Pie.last
    end

    it 'should assign current user as the creator of the pie' do
      sign_in(user)
      post :create, :pie => valid_attributes
      Pie.last.user.should == user
    end

    it 'should get edit' do
      sign_in(pie.user)
      get :edit, :id => pie
      response.should be_success
    end

    it 'should update the pie' do
      sign_in(pie.user)
      put :update, :id => pie, :pie => valid_attributes
      pie.reload
      pie.name.should == valid_attributes[:name]
      pie.description.should == valid_attributes[:description]
    end

    it 'should delete the pie' do
      sign_in(pie.user)
      expect {
        delete :destroy, :id => pie
      }.to change(Pie, :count).by(-1)
    end

  end

  context 'failure' do

    it 'should not get new if user is not signed in' do
      get :new
      response.should_not be_success
    end

    it 'should not create new pie if user is not signed in' do
      expect {
        post :create, :pie => valid_attributes
      }.to_not change(Pie, :count)
    end

    it 'should not get edit if the baker is not signed in' do
      sign_in(user)
      get :edit, :id => pie
      response.should_not be_success
    end

    it 'should not update the pie if the baker is not signed in' do
      sign_in(user)
      put :update, :id => pie, :pie => valid_attributes
      pie.reload
      pie.name.should_not == valid_attributes[:name]
      pie.description.should_not == valid_attributes[:description]
    end

    it 'should not delete the pie if the baker is not signed in' do
      sign_in(user)
      expect {
        delete :destroy, :id => pie
      }.to_not change(Pie, :count)
    end

  end

end
