class PostsController < ApplicationController
  before_action :require_login, except: %i[index show]


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

  def require_login
    unless user_signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_user_session_path 
    end
  end
end
