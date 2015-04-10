require 'test_helper'

describe User do
  let(:user) do
    User.create!(
      email: 'test@example.com',
      password: 'password',
      password_confirmation: 'password')
  end

  it 'must be valid' do
    user.must_be :valid?
  end

  it 'should have many pastes' do
    t = User.reflect_on_association(:pastes)
    assert_equal :has_many, t.macro
  end
end
