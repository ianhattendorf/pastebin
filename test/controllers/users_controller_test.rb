require 'test_helper'

describe UsersController do
  include Devise::TestHelpers

  let(:archer) { users(:archer) }
  let(:lana) { users(:lana) }

  it 'should get index' do
    get :index
    assert_response :success
  end

  it 'should get show' do
    get :show, id: archer
    assert_response :success
  end

  describe '#show' do
    it 'should list all pastes for current user' do
      sign_in archer
      get :show, id: archer
      assert_match 'fa-globe', response.body
      assert_match 'fa-unlock-alt', response.body
      assert_match 'fa-lock', response.body
    end

    it 'should only list public pastes for other users' do
      get :show, id: archer
      assert_match 'fa-globe', response.body
      refute_match 'fa-unlock-alt', response.body
      refute_match 'fa-lock', response.body
    end
  end
end
