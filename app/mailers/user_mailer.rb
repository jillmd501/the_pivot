class UserMailer < ActionMailer::Base
  default from: "stock-photos@example.com"

  def order_confirmation(user, order)
    @order = order
    @user = user
    mail(to: user.email,
         subject: 'Thank You For Your Order!')
  end
end
