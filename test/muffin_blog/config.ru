# This file is used by Rack-based servers to start the application.

# require_relative 'config/environment'

# run Rails.application

app = lambda do |env|
  [
    200,
    { 'Content-Type' => 'text/plain' },
    ['hello!!']
  ]
end

run app
