class UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save 
      Eventlist.new(user_id: @user.id).save
      render json: {alert: "Account Created :)"}
    else
      render json: {alert: "Username Taken :("}
    end
  end

  def login
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      @user.regenerate_session_token
      render json: {alert: "Successful sign in :)", user: {id: @user.id, username: @user.username, sessionToken: @user.session_token}}
    else
      render json: {alert: "Failed to sign in :(", user: {id: '', username: '', sessionToken: ''}}
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
