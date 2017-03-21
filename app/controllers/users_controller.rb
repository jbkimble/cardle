class UsersController < ApplicationController
  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "#{@user.first_name} #{@user.last_initial.capitalize}! Welcome to Cardle.
                        Checkout our quick start guide or just click around so we can get to know each other!"
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      # redirect_to signup_path
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:id, :first_name, :last_initial, :email, :password, :password_confirmation, :avatar)
    end
end
