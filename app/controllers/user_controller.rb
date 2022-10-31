class UserController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "successfully created Acount"
      # flash[:notice]="Signup successful"
      # redirect_to '/login'
    else
      flash[:notice]="Please try again"
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :user_name, :email, :password)
    end
end
