class PostsController < ApplicationController

  before_filter :require_user, only: [:new, :create]

  def index
    @posts = Post.all
  end
    
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create 
    @post = Post.new(params[:post])
    @post.user_id = @current_user.id
   
    if @post.save
      #flash[:notice] = "Post was created"
      redirect_to root_path
    else
      render :new
    end
  end

end