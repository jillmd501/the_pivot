class UserMailer < ActionMailer::Base
  default :from => "jillmd501@gmail.com"

  def order_confirmation(user)
    @user = user
    @url  = 'http://stalk-photos.herokuapp.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
