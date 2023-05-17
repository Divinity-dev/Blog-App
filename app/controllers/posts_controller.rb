class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = @user.posts
  end

  def show
    @Post = Post.find(params[:id])
  end
end
