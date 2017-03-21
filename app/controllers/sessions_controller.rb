class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      flash[:success] = "Successfully logged in #{@user.first_name}.  Welcome back to Cardle!"
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      flash[:failure] = "Login failed, please re-enter your information"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "Successfully logged out!"
    redirect_to root_path
  end

end
