require 'test_helper'

describe PastesHelper do
  let(:archer_paste) { pastes(:one) }
  let(:anonymous_paste) { pastes(:three) }
  let(:archer) { users(:archer) }

  describe '#posted_by' do
    it 'works with anonymous pastes' do
      @paste = anonymous_paste
      assert_equal 'anonymous', posted_by
    end

    it 'works with a user\'s paste' do
      @paste = archer_paste
      assert posted_by.include?(archer.email)
    end
  end

  describe '#syntax_highlight' do
    it 'returns formatted code' do
      assert syntax_highlight('puts "hello world"', :ruby).include?('<div class="code">')
    end
  end
end
