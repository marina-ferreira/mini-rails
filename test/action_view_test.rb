require 'test_helper'

class ActionViewTest < MiniTest::Test
  def test_render_template
    template = ActionView::Template.new('<p>Hello<p>', 'test_helper_template')
    context = ActionView::Base.new

    assert_equal '<p>Hello<p>', template.render(context)
  end
end
