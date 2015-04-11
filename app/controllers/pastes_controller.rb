class PastesController < ApplicationController
  impressionist actions: [:show, :download, :raw]
  before_action :paste_owner, only: [:edit, :update, :destroy]
  before_action :paste_view, only: [:show, :download, :raw]

  def index
    @paste = Paste.new
    @pastes = public_pastes
    @my_pastes = my_pastes
  end

  def show
  end

  def create
    if user_signed_in?
      @paste = current_user.pastes.new(paste_params)
    else
      @paste = Paste.new(paste_params)
    end
    if @paste.save
      redirect_to @paste
    else
      @pastes = public_pastes
      @my_pastes = my_pastes
      render :index
    end
  end

  def edit
  end

  def update
    if @paste.update_attributes(paste_params)
      redirect_to @paste
    else
      render :edit
    end
  end

  def destroy
    @paste.destroy
    redirect_to root_url
  end

  def download
    send_data @paste.content, filename: "#{@paste.title}.#{@paste.file_extension}", type: Mime::TEXT
  end

  def raw
    render plain: @paste.content
  end

  private

  def paste_params
    params.require(:paste).permit(:title, :content, :language, :visibility)
  end

  def paste_owner
    @paste = Paste.find(params[:id])
    return unless @paste.user.nil? || @paste.user != current_user
    redirect_to root_url, alert: 'You must be the owner of the paste to do that.'
  end

  def paste_view
    @paste = Paste.where('"pastes"."visibility" IN (0,2) OR "pastes"."user_id" = ?',
                         current_user).find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_url # TODO: redirect to 404 page
  end

  def public_pastes
    Paste.where(visibility: 0).order(created_at: :desc).limit(10)
  end

  def my_pastes
    Paste.where(user: current_user).order(created_at: :desc).limit(10) if user_signed_in?
  end
end
