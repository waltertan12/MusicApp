class TracksController < ApplicationController
  before_action :ensure_user_logged_in
  before_action :admin_user?, only: [:destroy]

  def new
    @track = Track.new
    @album  = Album.includes(:band).find(params[:album_id])
    @albums = @album.band.albums
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      flash[:success] = "Successfully created #{@track.name}!"
      redirect_to track_url(@track)
    else
      flash.now[:danger] = @track.errors.full_messages
      @track = Track.new
      @album  = Album.includes(:band).find(params[:album_id])
      @albums = @album.band.albums
      render :new
    end
  end

  def edit
    @track = Track.includes(:album, album: :band).find(params[:id])
    @album  = @track.album
    @albums = @album.band.albums
    render :edit
  end

  def show
    @track = Track.includes(:album, album: :band).find(params[:id])
    render :show
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(track_params)
      flash[:success] = "Successfully updated #{@track.name}!"
      redirect_to track_url(@track)
    else
      flash.new[:danger] = @track.errors.full_messages
      render :edit
    end 
  end

  def destroy
    @track = Track.find(params[:id])
    if @track
      flash[:success] = "Successfully deleted #{@track.name}"
      @track.destroy
      redirect_to root_url
    else
      flash.new[:danger] = "Cannot find track"
      render :edit
    end
  end

  private
  def track_params
    params.require(:track).permit(:name, :album_id, :lyrics, :bonus)
  end
end
