class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = current_user.posts.new
  end

  def show; end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
