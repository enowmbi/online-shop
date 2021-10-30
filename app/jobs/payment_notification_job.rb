class PaymentNotificationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    NotificationMailer.successful_payment_notification(args[0]).deliver_now
  end
end
