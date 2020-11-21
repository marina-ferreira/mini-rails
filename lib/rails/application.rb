module Rails
  class Application
    def self.inherited(klass)
      super
      @instance = klass.new
    end

    def self.instance
      @instance
    end

    def initialize!
      config_env_path = caller.first
      @root = Pathname.new(File.expand_path('../..', config_env_path))

      ActiveSupport::Dependencies.autoload_paths = Dir["#{@root}/app/*"]
      ActiveRecord::Base.establish_connection database: "#{@root}/db/#{Rails.env}.sqlite3"

      load @root.join('config/routes.rb')
    end

    def root
      @root
    end

    def routes
      @routes ||= ActionDispatch::Routing::RouteSet.new
    end
  end
end
