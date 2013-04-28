class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create 
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome aboard!"
      redirect_to root_path
    else
      render 'posts/show'
    end
  end

end