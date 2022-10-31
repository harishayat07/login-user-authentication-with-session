class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by :user_name => params[:user_name]

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Log in successfully"
      puts "logged in"
    else
      redirect_to '/login', notice: "Invalid Email or password"
      puts "Invalid email or password"
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login', notice: "Logged out"
    puts "logged out"
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :user_name, :email, :password)
    end
                
end
