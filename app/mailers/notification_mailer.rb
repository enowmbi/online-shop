class NotificationMailer < ApplicationMailer

  def successful_payment_notification(cart)
    @greeting = "Dear #{cart.user.email}"
    subject = "Successful Payment"
    @cart_id = cart.id
    mail(to: 'benowmbi@yahoo.com', subject: subject)
  end

  def failed_payment_notification(cart)
    @greeting = "Dear #{cart.user.email}"
    subject = "Payment was not successful"
    @cart_id = cart.id
    mail(to: cart.user.email, subject: subject)
  end
end
