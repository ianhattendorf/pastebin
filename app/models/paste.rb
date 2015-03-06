require 'coderay'

class Paste < ActiveRecord::Base
  validates :content, presence: true
  validates :language, inclusion: { in: proc { Paste.languages } }

  def self.languages
    %w(text c clojure cpp css delphi diff erb go groovy haml html java java_script json lua php
       python ruby sass sql xml yaml)
  end

  def title
    atr = self[:title]
    atr.empty? ? 'Untitled' : atr
  end

  def file_extension
    CodeRay.scanner(language.to_sym).file_extension
  end
end
