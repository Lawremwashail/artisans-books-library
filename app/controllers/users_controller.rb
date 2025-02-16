class UsersController < ApplicationController
  before_action :require_login, only: [:profile]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Account created successfully! Please log in."
      redirect_to login_path  
    else
      flash.now[:alert] = "Sign up failed. Please try again."
      render :new
    end
  end

  def profile
    @user = current_user
    @borrowed_books = @user.borrowings.where(returned: false).includes(:book).map(&:book)
  end     

  private

  def user_params 
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
