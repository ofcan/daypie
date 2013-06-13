require 'spec_helper'

describe PiesController do

  context 'success' do

    it 'should get index' do
      get :index
      response.should be_success
    end

  end

end
