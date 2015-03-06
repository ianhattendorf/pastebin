require 'test_helper'

describe PastesHelper do
  describe '#syntax_highlight' do
    it 'returns formatted code' do
      assert syntax_highlight('puts "hello world"', :ruby).include?('<div class="code">')
    end
  end
end
