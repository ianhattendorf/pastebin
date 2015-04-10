class PastesController < ApplicationController
  before_action :paste_owner, only: [:edit, :update, :destroy]

  def index
    @paste = Paste.new
    @pastes = Paste.all
  end

  def show
    @paste = Paste.find(params[:id])
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
      @pastes = Paste.all
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
    paste = Paste.find(params[:id])
    send_data paste.content, filename: "#{paste.title}.#{paste.file_extension}", type: Mime::TEXT
  end

  def raw
    paste = Paste.find(params[:id])
    render plain: paste.content
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
end
