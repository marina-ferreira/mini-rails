require 'test_helper'

require 'muffin_blog/app/models/application_record'
require 'muffin_blog/app/models/post'

class ActiveRecordTest < Minitest::Test
  def test_initialize
    post = Post.new(id: 1, title: 'The first post')
    assert_equal 1, post.id
    assert_equal 'The first post', post.title
  end
end
