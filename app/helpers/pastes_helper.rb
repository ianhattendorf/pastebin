require 'coderay'
require 'paste_visibility_helper'

module PastesHelper
  include PasteVisibilityHelper

  def syntax_highlight(code, language)
    CodeRay.scan(code, language).div(line_numbers: :inline)
  end

  def posted_by
    if @paste.user.nil?
      'anonymous'
    else
      link_to @paste.user.email, @paste.user
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
    levels = { 'Public' => :is_public, 'Private' => :is_private, 'Unlisted' => :is_unlisted }
    levels.except!('Private') unless user_signed_in?
    levels
  end
end
