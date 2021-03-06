class AlbumsController < ApplicationController
  before_action :ensure_user_logged_in
  before_action :admin_user?, only: [:destroy]
  
  def new
    @album = Album.new
    @band  = Band.find(params[:band_id])
    render :new
  end

  def create
    @album = Album.create(album_params)
    if @album.save
      flash[:success] = "Successfully created #{@album.title}!"
      redirect_to album_url(@album)
    else
      flash.new[:danger] = @album.errors.full_messages
      render :new
    end  
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      flash[:success] = "Successfully updated #{@album.title}!"
      redirect_to album_url(@album)
    else
      flash.new[:danger] = @album.errors.full_messages
      render :new
    end 
  end

  def show
    @album = Album.includes(:tracks).find(params[:id])
    render :show
  end

  def destroy
    @album = Album.find(params[:id])
    if @album
      flash[:success] = "Successfully deleted #{@album.title}"
      @album.destroy
      redirect_to root_url
    else
      flash.new[:danger] = "Cannot find album"
      render :edit
    end
  end

  private
  def album_params
    params.require(:album).permit(:title, :live, :band_id)
  end
end
