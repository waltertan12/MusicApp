class AlbumsController < ApplicationController
  def new
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
    @album = Band.find(params[:id])
    render :edit
  end

  def show
    @album = Band.find(params[:id])
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
