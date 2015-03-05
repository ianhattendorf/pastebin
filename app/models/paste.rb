class Paste < ActiveRecord::Base
  validates :content, presence: true

  def title
    atr = self[:title]
    atr.empty? ? 'Untitled' : atr
  end
end
