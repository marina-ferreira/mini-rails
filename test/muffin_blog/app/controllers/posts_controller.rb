class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @posts = Post.all

    response.write "<h1>The Muffin Blog</h1>"
    @posts.each do |post|
      response.write "<h2>#{post.title}</h2>"
    end
  end

  def show
    @post = Post.find(params[:id])

    render :show
  end

  def new

  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
