require 'coderay'

class Paste < ActiveRecord::Base
  validates :content, presence: true
  before_create :default_language

  def title
    atr = self[:title]
    atr.empty? ? 'Untitled' : atr
  end

  def file_extension
    CodeRay.scanner(language.to_sym).file_extension
  end

  private

  def default_language
    self.language ||= 'text'
  end
end
