require 'test_helper'

class ActionDispatchTest < MiniTest::Test
  def test_add_route
    routes = ActionDispatch::Routing::RouteSet.new
    route = routes.add_route 'GET', '/posts', 'posts', 'index'

    assert_equal 'posts', route.controller
    assert_equal 'index', route.action
  end

  def test_find_route
    routes = ActionDispatch::Routing::RouteSet.new
    route = routes.add_route 'GET', '/posts', 'posts', 'index'
    route = routes.add_route 'POST', '/posts', 'posts', 'create'

    request = Rack::Request.new(
      'REQUEST_METHOD' => 'POST',
      'PATH_INFO' => '/posts'
    )

    route = routes.find_route(request)

    assert_equal 'posts', route.controller
    assert_equal 'create', route.action
  end
end
