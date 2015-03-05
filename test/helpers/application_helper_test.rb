require 'test_helper'

describe ApplicationHelper do
  describe '#full_title' do
    it 'returns the base title' do
      assert_equal 'Pastebin', full_title
    end

    it 'returns the full title' do
      assert_equal 'Pastebin | About', full_title('About')
    end
  end
end
