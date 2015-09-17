class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user
      flash[:success] = "Welcome to MusicApp!"
      # login_user!
      redirect_to root_url
    else
      flash[:danger] = @user.errors.full_messages
      render :new
    end
  end

  # def edit
  #   render :edit
  # end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
