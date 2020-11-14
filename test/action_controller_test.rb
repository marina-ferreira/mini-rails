require 'test_helper'

class ActionControllerTest < MiniTest::Test
  class TestController < ActionController::Base
    def index
      response << 'index'
    end
  end

  def test_calls_index
    controller = TestController.new
    controller.response = []
    controller.process :index

    assert_equal ['index'], controller.response
  end
end
