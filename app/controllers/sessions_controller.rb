class SessionsController < ApplicationController
  def new; end
  
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to books_path, notice: "Logged in successfully!"
    else
      flash.now[:alert] = "Invalid email or password"
      render :new, status: :unprocessable_entity
    end
  end

  def logout
    if session[:user_id].nil?
      redirect_to login_path, alert: "You are already logged out. Login Here"
    else
      session[:user_id] = nil
      redirect_to root_path, notice: "Logged out!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end
end
