require 'active_support/core_ext/string' # has to be required because it has already been loaded
require 'active_support/core_ext/hash'

module ActiveSupport
  autoload :Dependencies, 'active_support/dependencies'
end
