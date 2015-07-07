@pub_key = (ENV['STRIPE_ENV'] == 'dev') ? ENV['STRIPE_TEST_PUB_KEY'] : ENV['STRIPE_PUB_KEY']
@secret_key = (ENV['STRIPE_ENV'] == 'dev') ? ENV['STRIPE_TEST_SECRET_KEY'] : ENV['STRIPE_SECRET_KEY']

Rails.configuration.stripe = {
    :publishable_key => @pub_key,
    :secret_key      => @secret_key
}

Stripe.api_key = @secret_key