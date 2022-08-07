Rails.application.config.middleware.insert_before 0, Rack::Cors do

  if Rails.env.development?
    allow do
      origins 'http://localhost:3000'
      resource '*', headers: :any, methods: [:get, :post, :delete, :patch, :put]
    end
  end

  if Rails.env.production?
    allow do
      origins 'https://task-todos-react.herokuapp.com'
      resource '*', headers: :any, methods: [:get, :post, :delete, :patch, :put]
    end
  end

end
