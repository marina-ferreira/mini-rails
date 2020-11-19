module ActionDispatch
  module Routing
    class Route < Struct.new(:method, :path, :controller, :action, :name)

      def match?(request)
        request.request_method == method && request.path_info == path
      end
    end

    class RouteSet
      def initialize
        @routes = []
      end

      def add_route(*args)
        route = Route.new(*args)
        @routes << route
        route
      end

      def find_route(request)
        @routes.detect { |route| route.match?(request) }
      end

      def draw(&block)
        mapper = Mapper.new(self)
        mapper.instance_eval(&block)
      end
    end
  end
end
