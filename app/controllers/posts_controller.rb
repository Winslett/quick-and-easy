class PostsController < ApplicationController

  def index
    @posts = Post.where(parent_id: nil).order_by(:_id.desc)
  end

  def new
    @post = Post.new(params[:post])
    @post.message ||= Message.new
  end

  def create
    @post = Post.new(params[:post])
    @post.creator = current_user.as_creator

    if @post.save
      redirect_to @post
    else
      render :action => "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end
end
