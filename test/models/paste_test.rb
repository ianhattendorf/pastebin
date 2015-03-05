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
    @paste.title = ''
    assert @paste.valid?
  end

  it 'should have a default language' do
    @paste.language = nil
    @paste.save!
    assert_equal 'text', @paste.language
  end

  it 'should save it\'s language' do
    @paste.save!
    assert_equal 'ruby', @paste.language
  end

  it 'should know it\'s file extension' do
    assert_equal 'rb', @paste.file_extension
  end
end
