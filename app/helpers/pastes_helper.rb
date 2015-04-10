require 'coderay'

module PastesHelper
  def syntax_highlight(code, language)
    CodeRay.scan(code, language).div(line_numbers: :inline)
  end

  def posted_by(paste)
    if paste.user.nil?
      'anonymous'
    else
      paste.user.email
    end
  end
end
