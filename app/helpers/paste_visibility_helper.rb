module PasteVisibilityHelper
  def paste_visibility_icon(paste)
    case paste.visibility
    when 'is_public'
      'fa-globe'
    when 'is_unlisted'
      'fa-unlock-alt'
    when 'is_private'
      'fa-lock'
    end
  end
end
