require 'spec_helper'

describe PiesController do

let!(:pie) { create :pie }
let!(:valid_attributes) { attributes_for :pie }

  context 'success' do

    it 'should get index' do
      get :index
      response.should be_success
    end

    it 'should get new' do
      get :new
      response.should be_success
    end

    it 'should get show' do
      get :show, :id => pie
      response.should be_success
    end

    it 'should create new pie' do
      expect {
        post :create, :pie => valid_attributes
      }.to change(Pie, :count).by(1)
      response.should redirect_to Pie.last
    end

    it 'should get edit' do
      get :edit, :id => pie
      response.should be_success
    end

    it 'should update the pie' do
      put :update, :id => pie, :pie => valid_attributes
      pie.reload
      pie.name.should == valid_attributes[:name]
      pie.description.should == valid_attributes[:description]
    end

    it 'should delete the pie' do
      expect {
        delete :destroy, :id => pie
      }.to change(Pie, :count).by(-1)
    end

  end

end
