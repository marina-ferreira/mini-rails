require 'test_helper'

class ActionCableTest < Minitest::Test
  def setup
    @server = Thin::Server.new(8082, ActionCable.server)
    Thin::Logging.silent = true

    @thread = Thread.new { @server.start }
    wait_for { @server.running? }
  end

  def teardown
    @server.stop!
    @thread.join
  end

  def wait_for
    Timeout.timeout 3 do
      Thread.pass until yield
    end
  end
end
