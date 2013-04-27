class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(username: params[:username]).first

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      #flash[:notice] = "Howdy, you're now logged in."
      redirect_to root_path

    else
      flash[:error] = "Your username and password aren't on the guestlist. Try again or register."
      redirect_to new_user_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Thank you. Come again."
    redirect_to root_path
  end
end