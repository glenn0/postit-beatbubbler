class PostsController < ApplicationController

  before_filter :require_user, only: [:new, :create, :vote]
  before_filter :find_post, only: [:edit, :update, :vote] #creates the @post variable for the require_creator filter.
  before_filter :require_creator, only: [:edit, :update]

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

  def edit
    @post = Post.find(params[:id])
  end

  def vote
    Vote.create(voteable: @post, user: current_user, vote: params[:vote])
    flash[:notice] = "Thanks for voting!"
    redirect_to :back
  end


# Filter Methods
  
  def find_post
    @post = Post.find(params[:id])
  end

  def require_creator
    unless logged_in? && current_user == @post.user
      flash[:error] = "You're not allowed to do that."
      redirect_to root_path
    end
  end

end