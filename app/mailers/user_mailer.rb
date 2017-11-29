class UserMailer < ApplicationMailer

  def like_email(user)
    @user = user
    mail(to: @user.email, subject:"Someone Liked Your Note")
  end

  def unlike_email(user)
    @user = user
    mail(to: @user.email, subject:"Someone Unliked Your Note")
  end

end
