require 'test_helper'

describe PastesController do
  include Devise::TestHelpers

  let(:archer) { users(:archer) }
  let(:lana) { users(:lana) }
  let(:paste) { pastes(:one) }

  it 'should get index' do
    get :index
    assert_response :success
  end

  it 'should get show' do
    get :show, id: paste
    assert_response :success
  end

  it 'should get show with owner' do
    sign_in archer
    get :show, id: paste
    assert_response :success
  end

  it 'should get show with non-owner' do
    sign_in lana
    get :show, id: paste
    assert_response :success
  end

  it 'should post create' do
    post :create, paste: { title: 'a title', content: 'some content', language: 'ruby' }
    assert_response :redirect
  end

  it 'should post create when signed in' do
    sign_in archer
    post :create, paste: { title: 'a title', content: 'some content', language: 'ruby' }
    assert_response :redirect
  end

  it 'should render index if create fails' do
    post :create, paste: { title: '', content: '' }
    assert_template :index
  end

  it 'should get edit' do
    sign_in archer
    get :edit, id: paste
    assert_response :success
  end

  it 'should redirect if not signed in' do
    get :edit, id: paste
    assert_redirected_to root_url
  end

  it 'should redirect if unauthorized' do
    sign_in lana
    get :edit, id: paste
    assert_redirected_to root_url
  end

  it 'should patch update' do
    sign_in archer
    patch :update, id: paste, paste: { title: 'a title', content: 'some content', language: 'cpp' }
    assert_redirected_to paste
  end

  it 'should render edit if update fails' do
    sign_in archer
    patch :update, id: paste, paste: { title: '', content: '' }
    assert_template :edit
  end

  it 'should delete destroy' do
    sign_in archer
    paste_count = archer.pastes.count
    delete :destroy, id: paste
    assert_redirected_to root_url
    assert_equal paste_count - 1, archer.pastes.count
  end

  it 'should get download' do
    get :download, id: paste
    assert_equal paste.content, response.body
    assert_match 'text/plain', response.header['Content-Type']
  end

  it 'should get raw' do
    get :raw, id: paste
    assert_equal paste.content, response.body
    assert_match 'text/plain', response.header['Content-Type']
  end
end
