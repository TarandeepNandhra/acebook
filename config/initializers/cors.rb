# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # CHANGE TO HEROKU LINK WHEN FRONTEND IS DEPLOYED
    origins 'http://localhost:19006'
<<<<<<< HEAD
    
=======

>>>>>>> d9a1eaf58c1324a08dd130326af13670f9f5c187

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true
  end
end
