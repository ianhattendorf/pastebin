require 'coderay'

module PastesHelper
  def syntax_highlight(code, language)
    CodeRay.scan(code, language).div(line_numbers: :inline)
  end
end
