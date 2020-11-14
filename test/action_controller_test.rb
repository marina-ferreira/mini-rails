require 'test_helper'

class ActionControllerTest < MiniTest::Test
  class TestController < ActionController::Base
    before_action :callback, only: [:show]

    def index
      response << 'index'
    end

    def show
      response << 'show'
    end

    private

    def callback
      response << 'callback'
    end
  end

  def test_calls_index
    controller = TestController.new
    controller.response = []
    controller.process :index

    assert_equal ['index'], controller.response
  end

  def test_callbacks
    controller = TestController.new
    controller.response = []
    controller.process :show

    assert_equal ['callback', 'show'], controller.response
  end
end
