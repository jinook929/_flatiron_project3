Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, Rails.application.credentials.google[:google_id], Rails.application.credentials.google[:google_secret]
end