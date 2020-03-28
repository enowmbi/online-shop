<<<<<<< HEAD
Rails.configuration.stripe = {
  :publishable_key => Rails.application.credentials.stripe.dig(:publishable_key),
  :secret_key      => Rails.application.credentials.stripe.dig(:secret_key)
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

=======
 Rails.configuration.stripe = {
   :publishable_key => Rails.application.credentials.stripe.dig(:publishable_key),
   :secret_key      => Rails.application.credentials.stripe.dig(:secret_key)
}

 Stripe.api_key = Rails.configuration.stripe[:secret_key]
>>>>>>> cdbcaeb... Add stripe.rb to config/initializers
