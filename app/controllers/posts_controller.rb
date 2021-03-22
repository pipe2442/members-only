class PostsController < ApplicationController

    before_action :authenticate_user!, except: [:index, :show] 
    
    def new
        @post = Post.new 
    end

    def create
    end

    def index
    end
end
