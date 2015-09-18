class UserMailer < ApplicationMailer
  def user_created(user)
    @user  = user
    @login = new_session_url
    mail(to: @user.email, subject: "You signed up for Jenius...")
  end
end
