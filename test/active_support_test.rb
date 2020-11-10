require 'test_helper'

require 'active_support'

class ActiveSupportTest < MiniTest::Test
  def setup
    ActiveSupport::Dependencies.autoload_paths = Dir["#{__dir__}/muffin_blog/app/*"]
  end

  def test_search_for_file_valid
    file = ActiveSupport::Dependencies.search_for_file('application_controller')
    assert_equal "#{__dir__}/muffin_blog/app/controllers/application_controller.rb", file
  end

  def test_search_for_file_invalid
    file = ActiveSupport::Dependencies.search_for_file('unknown')
    assert_nil file
  end

  def test_case_name
    assert_equal 'post', :Post.to_s.underscore
    assert_equal 'application_controller', :ApplicationController.to_s.underscore
  end
end
