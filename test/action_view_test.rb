require 'test_helper'

class ActionViewTest < MiniTest::Test
  def test_render_template
    template = ActionView::Template.new('<p>Hello</p>', 'test_helper_template')
    context = ActionView::Base.new

    assert_equal '<p>Hello</p>', template.render(context)
  end

  def test_render_with_vars
    template = ActionView::Template.new('<p><%= @var %></p>', 'test_helper_with_vars')
    context = ActionView::Base.new var: 'var value'

    assert_equal '<p>var value</p>', template.render(context)
  end

  def test_render_with_yield
    template = ActionView::Template.new('<p><%= yield %></p>', 'test_helper_with_yield')
    context = ActionView::Base.new var: 'var value'

    assert_equal '<p>yielded content</p>', template.render(context) { 'yielded content' }
  end

  def test_render_with_helper
    template = ActionView::Template.new("<%= link_to 'title', '/url' %>", 'test_helper_with_helper')
    context = ActionView::Base.new var: 'var value'

    assert_equal '<a href="/url">title</a>', template.render(context)
  end

  def test_find_template
    file = "#{__dir__}/muffin_blog/app/views/posts/index.html.erb"
    template1 = ActionView::Template.find(file)
    template2 = ActionView::Template.find(file)

    assert_same template1, template2
  end

  class TestController < ActionController::Base
    def index
      @var = 'var value'
    end
  end

  def test_view_assigns
    controller = TestController.new
    controller.index
    assert_equal({ 'var' => 'var value' }, controller.view_assigns)
  end

  def test_render
    request = Rack::MockRequest.new(Rails.application)
    response = request.get('/posts/show?id=1')

    assert_match '<h1>Blueberry Muffins</h1>', response.body
  end
end
