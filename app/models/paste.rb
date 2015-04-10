require 'coderay'

class Paste < ActiveRecord::Base
  belongs_to :user
  validates :content, presence: true
  validates :language, inclusion: { in: proc { Paste.languages } }
  before_save :default_title

  def self.languages
    %w(text c clojure cpp css delphi diff erb go groovy haml html java java_script json lua php
       python ruby sass sql xml yaml)
  end

  def file_extension
    CodeRay.scanner(language.to_sym).file_extension
  end

  private

  def default_title
    self.title = 'Untitled' if title.blank?
  end
end
