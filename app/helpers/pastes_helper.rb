require 'coderay'

module PastesHelper
  def syntax_highlight(code, language)
    CodeRay.scan(code, language).div(line_numbers: :inline)
  end

  def languages
    %w(text c clojure cpp css delphi diff erb go groovy haml html java java_script json lua php
       python ruby sass sql xml yaml)
  end
end
