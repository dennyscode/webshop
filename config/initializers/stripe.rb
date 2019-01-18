
env_file = File.join(Rails.root, 'config', 'local_env.yml')
YAML.load(File.open(env_file)).each do |key, value|
  ENV[key.to_s] = value
end if File.exists?(env_file)

if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_6XAudWJ4kxO3LAD6Zjl1fvtM',
    secret_key: 'sk_test_GYQZm2uJgTshJJf1YN1vJbSj'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
