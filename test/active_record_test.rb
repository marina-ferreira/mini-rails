require 'test_helper'

require 'active_record'
require 'active_support'

class ActiveRecordTest < Minitest::Test
  def setup
    ActiveSupport::Dependencies.autoload_paths = Dir["#{__dir__}/muffin_blog/app/*"]

    Post.establish_connection database: "#{__dir__}/muffin_blog/db/development.sqlite3"
  end

  def test_initialize
    post = Post.new(id: 1, title: 'The first post')
    assert_equal 1, post.id
    assert_equal 'The first post', post.title
  end

  def test_find
    post = Post.find(1)
    assert_kind_of Post, post
    assert_equal 1, post.id
    assert_equal 'Blueberry Muffins', post.title
  end

  def test_all
    post = Post.all.first
    assert_kind_of Post, post
    assert_equal 1, post.id
    assert_equal 'Blueberry Muffins', post.title
  end

  def test_execute_sql
    rows = Post.connection.execute('SELECT * FROM posts')
    assert_kind_of Array, rows

    row = rows.first
    assert_kind_of Hash, row

    assert_equal [:id, :title, :body, :created_at, :updated_at], row.keys
  end

  def test_where
    relation = Post.where('id = 2').where('title IS NOT NULL')

    assert_equal 'SELECT * FROM posts WHERE id = 2 AND title IS NOT NULL', relation.to_sql

    post = relation.first
    assert_equal post.id, 2
  end
end
