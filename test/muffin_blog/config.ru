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

#middleware structure
class Logger
  def initialize(app)
    @app = app
  end

  def call(env)
    method = env['REQUEST_METHOD']
    path = env['PATH_INFO']
    puts "#{method} #{path}"

    @app.call(env)
  end
end

# use Rack::CommonLogger # works simililarly to Logger
use Rack::ShowExceptions

run app
