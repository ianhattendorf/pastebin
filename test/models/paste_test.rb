require 'test_helper'

describe Paste do
  let(:paste) { Paste.new }

  it 'must be valid' do
    paste.must_be :valid?
  end
end
