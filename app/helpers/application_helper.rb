module ApplicationHelper
  @base_title = 'Pastebin'

  # Returns the full page title based on the current page
  def full_title(page_title = '')
    if page_title.empty?
      @base_title
    else
      "#{@base_title} | #{page_title}"
    end
  end
end
