class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def welcome_email(line_items, current_user, order_id)
    @line_items = line_items
    @order_id = order_id
    @user = current_user
    @url  = 'http://localhost:3000'
    mail(to: @user.email, subject: 'Your order details')
  end
end
