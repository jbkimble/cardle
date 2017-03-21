class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      flash[:success] = "Successfully logged in!"
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash[:failure] = "Something went wrong!"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "Successfully logged out!"
    redirect_to root_path
  end

end
