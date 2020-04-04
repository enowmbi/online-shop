class PaymentFailureNotificationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    NotificationMailer.failed_payment_notification(args[0]).deliver
  end
end
