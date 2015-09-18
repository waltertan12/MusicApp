class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = "Please check for a confirmation email!"
      # log_in_user!(user)
      msg = UserMailer.user_created(user)
      msg.deliver_now
      redirect_to root_url
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

  def activate
    user = User.find_by(activation_token: params[:activation_token])
    user.activate_user
    log_in_user!(user)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
