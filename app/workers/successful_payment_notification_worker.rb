# frozen_string_literal: true

# sends mail information user of unsuccessful payment
class SuccessfulPaymentNotificationWorker
  include Sidekiq::Worker
  sidekiq_options queue: :successful_payment_notification, retry: 3

  def perform(cart)
    NotificationMailer.successful_payment_notification(cart).deliver_async
  rescue StandardException => e
    # TODO: setup sentry to logging and reporting errors in real time
    # Sentry.capture_exception(e)

    Rails.logger.error("Error in SuccessfulPaymentNotificationWorker -#{e.message}")
  end
end
