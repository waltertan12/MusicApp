class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = "Please check for a confirmation email!"
      # log_in_user!(user)
      UserMailer.user_created(user)
      msg.deliver_now
      redirect_to user_url(user)
    else
      flash.now[:danger] = user.errors.full_messages
      render :new
    end
  end

  # def edit
  #   render :edit
  # end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
