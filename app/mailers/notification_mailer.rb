class NotificationMailer < ApplicationMailer

  def successful_payment_notification(cart_id)
    @greeting = "Dear #{current_user.email}"
    @subject = "Successful Payment"
    @cart_id = cart_id
    mail to: current_user.email
  end

  def failed_payment_notification(cart_id)
    @greeting = "Dear #{current_user.email}"
    @subject = "Payment was not successful"
    @cart_id = cart_id
    mail to: current_user.email
  end
end
