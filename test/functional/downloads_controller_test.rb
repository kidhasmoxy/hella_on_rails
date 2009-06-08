require File.dirname(__FILE__) + '/../test_helper'

class DownloadsControllerTest < ActionController::TestCase
  context 'GET to index' do
    setup do
      get :index
    end
    should_respond_with :success
    should_assign_to :downloads
  end

  context 'GET to new' do
    setup do
      get :new
    end

    should_respond_with :success
    should_render_template :new
    should_assign_to :download
  end

  context 'POST to create' do
    setup do
      post :create, :download => Factory.attributes_for(:download)
      @download = Download.find(:all).last
    end
    
    should_redirect_to 'download_path(@download)'
  end

  context 'GET to show' do
    setup do
      @download = Factory(:download)
      get :show, :id => @download.id
    end
    should_respond_with :success
    should_render_template :show
    should_assign_to :download
  end

  context 'GET to edit' do
    setup do
      @download = Factory(:download)
      get :edit, :id => @download.id
    end
    should_respond_with :success
    should_render_template :edit
    should_assign_to :download
  end

  context 'PUT to update' do
    setup do
      @download = Factory(:download)
      put :update, :id => @download.id, :download => Factory.attributes_for(:download)
    end
    should_redirect_to 'download_path(@download)'
  end

  context 'DELETE to destroy' do
    setup do
      @download = Factory(:download)
      delete :destroy, :id => @download.id
    end
    should_redirect_to 'downloads_path'
  end
end
