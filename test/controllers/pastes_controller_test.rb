require 'test_helper'

describe PastesController do
  before do
    @paste = pastes(:one)
  end

  it 'should get index' do
    get :index
    assert_response :success
  end

  it 'should get show' do
    get :show, id: @paste
    assert_response :success
  end

  it 'should post create' do
    post :create, paste: { title: 'a title', content: 'some content' }
    assert_response :redirect
  end

  it 'should get edit' do
    get :edit, id: @paste
    assert_response :success
  end

  it 'should patch update' do
    patch :update, id: @paste, paste: { title: 'a title', content: 'some content' }
    assert_redirected_to @paste
  end

  it 'should delete destroy' do
    delete :destroy, id: @paste
    assert_redirected_to root_url
  end
end
