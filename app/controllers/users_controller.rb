class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    @user.generate_session_token
  end

  def login
    @user = User.find_by(params[:username])
    if @user && @user.authenticate(params[:params][:password])
      @user.regenerate_session_token
      return @user.session_token
    else
      return "error"
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
