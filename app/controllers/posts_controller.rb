class PostsController < ApplicationController
  before_action :logged_in_user, only: %i[new create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(body: params[:post][:body], user_id: current_user.id)
    if @post.save
      redirect_to root_url
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  private

  def logged_in_user
    unless logged_in?
      flash[:danger] = 'time to log in.'
      redirect_to login_path
    end
  end
end
