class UserMailer < ActionMailer::Base
  default :from => "jillmd501@gmail.com"

  def order_confirmation(user)
    @user = user
    mail(to: user.email,
         subject: 'Thank You For Your Order!')
  end
end
