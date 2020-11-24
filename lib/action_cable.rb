module ActionCable
  autoload :Server, 'action_cable/server'
  autoload :Connection, 'action_cable/connection'
  autoload :Channel, 'action_cable/channel'

  def self.server
    @server ||= Server.new
  end
end
