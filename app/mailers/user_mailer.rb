class UserMailer < ActionMailer::Base
  default from: "no-reply@lomadex.com"

  def sign_up_email(user)
  	@user = user
  	mail(to: user.email, subject: "Welcome to Lomadex!")
  end
end
