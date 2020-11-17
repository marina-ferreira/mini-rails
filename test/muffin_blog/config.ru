# This file is used by Rack-based servers to start the application.

# require_relative 'config/environment'

# run Rails.application

class App
  def call(env)
    [
      200,
      { 'Content-Type' => 'text/plain' },
      ['hello!!']
    ]
  end
end

run App.new
