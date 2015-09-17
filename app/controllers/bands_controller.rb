class BandsController < ApplicationController
  def new
    render :new
  end

  def index
    @bands = Band.all
    render :index
  end

  def create
    @band = Band.create(band_params)
    if @band.save
      flash[:success] = "Successfully created #{@band.name}!"
      redirect_to band_url(@band)
    else
      flash.new[:danger] = @band.errors.full_messages
      render :new
    end  
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])
    if @band.update(band_params)
      flash[:success] = "Successfully updated #{@band.name}!"
      redirect_to band_url(@band)
    else
      flash.new[:danger] = @band.errors.full_messages
      render :new
    end 
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def destroy
    @band = Album.find(params[:id])
    if @band
      flash[:success] = "Successfully deleted #{@band.name}"
      @band.destroy
      redirect_to root_url
    else
      flash.new[:danger] = "Cannot find band"
      render :edit
    end
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end