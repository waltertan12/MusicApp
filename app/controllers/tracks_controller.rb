class TracksController < ApplicationController
  def new
    render :new
  end

  def create
    @track = Track.create(track_params)
    if @track.save
      flash[:success] = "Successfully created #{@track.name}!"
      redirect_to track_url(@track)
    else
      flash.new[:danger] = @track.errors.full_messages
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])
    render :edit
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def update
    @track = Track.find(params[:id])
    if @track.update(band_params)
      flash[:success] = "Successfully updated #{@track.name}!"
      redirect_to band_url(@track)
    else
      flash.new[:danger] = @track.errors.full_messages
      render :new
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
    params.require(:track).permit(:album_id, :lyrics, :bonus)
  end
end
