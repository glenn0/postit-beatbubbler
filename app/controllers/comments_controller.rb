class CommentsController < ApplicationController
  def create 
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params[:comment])
    @comment.user_id = 1
    @comment.post = @post

    if @comment.save
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

end