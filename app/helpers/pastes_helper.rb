require 'coderay'

module PastesHelper
  def syntax_highlight(code, language)
    CodeRay.scan(code, language).div(line_numbers: :inline)
  end

  def posted_by
    if @paste.user.nil?
      'anonymous'
    else
      @paste.user.email
    end
  end

  def owner?
    if user_signed_in?
      @paste.user == current_user
    else
      false
    end
  end

  def valid_visibility_levels
    visibility_levels = Paste.visibilities.dup
    visibility_levels.except!(:is_private) unless user_signed_in?
    visibility_levels
  end
end
