class CommentsController < ApplicationController

  before_filter :require_user, only: [:new, :create]

  def create 
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params[:comment])
    @comment.user_id = @current_user.id # TODO set to logged in user
    @comment.post = @post

    if @comment.save
      redirect_to post_path(@comment.post)
    else
      render 'posts/show'
    end
  end

end

