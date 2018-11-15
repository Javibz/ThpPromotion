Mailjet.configure do |config|
  config.api_key = ENV["MAILCHIMP_API_KEY"]
  config.secret_key = ENV["MAILCHIMP_SECRET_KEY"]
  config.default_from = 'THP'
end