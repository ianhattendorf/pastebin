ruby_content = <<PASTE_CONTENT
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
end
PASTE_CONTENT

text_content = <<PASTE_CONTENT
Cornhole vegan meditation blog, mixtape readymade viral small batch Thundercats
letterpress locavore. Fingerstache post-ironic yr, brunch crucifix McSweeney's
cold-pressed umami retro ugh beard 90's selfies. Blog wolf small batch sriracha
Neutra. Flannel farm-to-table scenester plaid pork belly shabby chic. Wolf
American Apparel +1 biodiesel, cold-pressed sartorial Austin banjo.
Farm-to-table aesthetic skateboard, yr YOLO bitters pour-over meh banh
mi tousled dreamcatcher semiotics messenger bag freegan. Godard paleo American
Apparel, viral Carles Intelligentsia vinyl.
PASTE_CONTENT

archer = User.create!(email: 'archer@example.com', password: '12341234')
lana = User.create!(email: 'lana@example.com', password: 'asdfasdf')

archer.pastes.create!(title: 'So hip', content: text_content, language: 'text')
archer.pastes.create!(content: 'untitled paste', language: 'text')
archer.pastes.create!(
  title: 'private paste',
  content: 'secrets',
  language: 'text',
  visibility: :is_private)

lana.pastes.create!(title: 'lana\'s paste', content: 'nonsense', language: 'text')
lana.pastes.create!(
  title: 'unlisted paste',
  content: 'unlisted',
  language: 'text',
  visibility: :is_unlisted)

Paste.create!(title: 'Anonymous paste', content: ruby_content, language: 'ruby')
