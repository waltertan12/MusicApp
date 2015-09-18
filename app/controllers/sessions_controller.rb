class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:email], 
                                    params[:user][:password])
    if user && user.activated?
      log_in_user!(user)
      redirect_to user_url(user)
    elsif user && !user.activated?
      flash[:danger] = "Please check for a confirmation email"
      msg = UserMailer.user_created(user)
      msg.deliver_now
      redirect_to new_session_url
    else
      flash.now[:danger] = "Email or password is incorrect"
      render :new
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to root_url
  end
end
