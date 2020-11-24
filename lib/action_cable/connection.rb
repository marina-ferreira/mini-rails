Faye::WebSocket.load_adapter 'thin' if defined? Thin

module ActionCable
  module Connection
    class Base
      def initialize(server, env)
        @server = server
        @websocket = Faye::WebSocket.new(env)

        @websocket.on :message do |event|
          # ...
        end
      end

      def process
        @websocket.rack_response
      end
    end
  end
end
