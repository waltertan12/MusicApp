class UserMailer < ApplicationMailer
  def user_created(user)
    @user  = user
    @url = activate_user_url(user) + "/?activation_token=#{@user.activation_token}"
    mail(to: @user.email, subject: "You signed up for Jenius...")
  end
end
