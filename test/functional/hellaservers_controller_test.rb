require File.dirname(__FILE__) + '/../test_helper'

class HellaserversControllerTest < ActionController::TestCase
  context 'GET to index' do
    setup do
      get :index
    end
    should_respond_with :success
    should_assign_to :hellaservers
  end

  context 'GET to new' do
    setup do
      get :new
    end

    should_respond_with :success
    should_render_template :new
    should_assign_to :hellaserver
  end

  context 'POST to create' do
    setup do
      post :create, :hellaserver => Factory.attributes_for(:hellaserver)
      @hellaserver = Hellaserver.find(:all).last
    end
    
    should_redirect_to 'hellaserver_path(@hellaserver)'
  end

  context 'GET to show' do
    setup do
      @hellaserver = Factory(:hellaserver)
      get :show, :id => @hellaserver.id
    end
    should_respond_with :success
    should_render_template :show
    should_assign_to :hellaserver
  end

  context 'GET to edit' do
    setup do
      @hellaserver = Factory(:hellaserver)
      get :edit, :id => @hellaserver.id
    end
    should_respond_with :success
    should_render_template :edit
    should_assign_to :hellaserver
  end

  context 'PUT to update' do
    setup do
      @hellaserver = Factory(:hellaserver)
      put :update, :id => @hellaserver.id, :hellaserver => Factory.attributes_for(:hellaserver)
    end
    should_redirect_to 'hellaserver_path(@hellaserver)'
  end

  context 'DELETE to destroy' do
    setup do
      @hellaserver = Factory(:hellaserver)
      delete :destroy, :id => @hellaserver.id
    end
    should_redirect_to 'hellaservers_path'
  end
end
