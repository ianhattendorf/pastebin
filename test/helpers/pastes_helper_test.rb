require 'test_helper'

describe PastesHelper do
  describe '#syntax_highlight' do
    it 'returns formatted code' do
      assert syntax_highlight('puts "hello world"', :ruby).include?('<div class="code">')
    end
  end

  describe '#languages' do
    it 'is an array' do
      assert languages.is_a?(Array)
    end

    it 'is not empty' do
      assert_not languages.empty?
    end
  end
end
