class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id  # Log the user in after signup
      redirect_to books_path, notice: "Account created successfully!"
    else
      flash[:alert] = "Sign up failed. Please check the form."
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
