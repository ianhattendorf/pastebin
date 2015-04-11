class UsersController < ApplicationController
  def index
    @users = User.all.order(:id)
  end

  def show
    @user = User.find(params[:id])
    @pastes = @user.pastes.where('"pastes"."visibility" = 0 OR "pastes"."user_id" = ?',
                                 current_user)
  end
end
