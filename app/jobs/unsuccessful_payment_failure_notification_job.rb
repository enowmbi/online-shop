class UnsuccesfulPaymentNotificationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    NotificationMailer.unsuccessful_payment_notification(args[0]).deliver
  end
end
