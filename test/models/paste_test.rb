require 'test_helper'

describe Paste do
  before do
    @paste = Paste.new(title: 'some title', content: 'some content', language: 'ruby')
  end

  it 'should be valid' do
    assert @paste.valid?
  end

  it 'should have content' do
    @paste.content = ''
    assert @paste.invalid?
  end

  it 'should not require a title' do
    untitled_paste = Paste.new(title: '', content: 'more content', language: 'text')
    assert untitled_paste.save
    assert_equal 'Untitled', untitled_paste.title
  end

  it 'should have a language' do
    @paste.language = ''
    assert @paste.invalid?
  end

  it 'should know it\'s file extension' do
    assert_equal 'rb', @paste.file_extension
  end

  it 'only accepts valid languages' do
    @paste.language = 'not a language'
    assert @paste.invalid?
  end
end
