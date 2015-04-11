require 'paste_visibility_helper'

module UsersHelper
  include PasteVisibilityHelper

  def user_owner?
    if user_signed_in?
      @user == current_user
    else
      false
    end
  end
end
