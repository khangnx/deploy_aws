class NotifierMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier_mailer.order_received.subject
  #
  default :from => 'This is mail from coca book store'
  def order_received(order)
   @order = order
   mail :to => @order.email, :subject => 'We have recived your order'
  end
  def user_register_email user
    @user = user
    mail :to => @user.email, :subject => 'This is email register account'
  end
end
