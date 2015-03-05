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
    post :create, paste: { title: 'a title', content: 'some content', language: 'ruby' }
    assert_response :redirect
  end

  it 'should render index if create fails' do
    post :create, paste: { title: '', content: '' }
    assert_template :index
  end

  it 'should get edit' do
    get :edit, id: @paste
    assert_response :success
  end

  it 'should patch update' do
    patch :update, id: @paste, paste: { title: 'a title', content: 'some content', language: 'cpp' }
    assert_redirected_to @paste
  end

  it 'should render edit if update fails' do
    patch :update, id: @paste, paste: { title: '', content: '' }
    assert_template :edit
  end

  it 'should delete destroy' do
    delete :destroy, id: @paste
    assert_redirected_to root_url
  end
end
