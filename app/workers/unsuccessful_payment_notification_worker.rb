# frozen_string_literal: true

# sends mail information user of unsuccessful payment
class UnsuccesfulPaymentNotificationWorker
  include Sidekiq::Worker
  sidekiq_options queue: :unsuccessful_payment_notification, retry: 3

  def perform(cart)
    NotificationMailer.unsuccessful_payment_notification(cart).deliver_later
  rescue StandardException => e
    # TODO: setup sentry to logging and reporting errors in real time
    # Sentry.capture_exception(e)

    Rails.logger.error("Error in UnsuccessfulPaymentNotificationWorker -#{e.message}")
  end
end
