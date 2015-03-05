class PastesController < ApplicationController
  def index
    @paste = Paste.new
    @pastes = Paste.all
  end

  def show
    @paste = Paste.find(params[:id])
  end

  def create
    @paste = Paste.new(paste_params)
    if @paste.save
      redirect_to @paste
    else
      @pastes = Paste.all
      render :index
    end
  end

  def edit
    @paste = Paste.find(params[:id])
  end

  def update
    @paste = Paste.find(params[:id])
    if @paste.update_attributes(paste_params)
      redirect_to @paste
    else
      render :edit
    end
  end

  def destroy
    Paste.find(params[:id]).destroy
    redirect_to root_url
  end

  private

  def paste_params
    params.require(:paste).permit(:title, :content)
  end
end
