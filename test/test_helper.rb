$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "minitest/autorun"
require 'rack/mock'

require_relative 'muffin_blog/config/environment'
