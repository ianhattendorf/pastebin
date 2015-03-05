require 'test_helper'

describe Paste do
  before do
    @paste = Paste.new(title: 'some title', content: 'some content')
  end

  it 'should be valid' do
    assert @paste.valid?
  end

  it 'should have content' do
    @paste.content = ''
    assert @paste.invalid?
  end

  it 'should not require a title' do
    @paste.title = ''
    assert @paste.valid?
  end
end
