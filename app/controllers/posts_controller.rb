class PostsController < ApplicationController

  def index
    Post.order_by(:_id.desc)
  end

  def new
    @post = Post.new(params[:post])
  end

end
