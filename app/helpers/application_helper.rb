module ApplicationHelper
  BASE_TITLE = 'Pastebin'.freeze

  # Returns the full page title based on the current page
  def full_title(page_title = '')
    if page_title.empty?
      BASE_TITLE
    else
      "#{BASE_TITLE} | #{page_title}"
    end
  end
end
