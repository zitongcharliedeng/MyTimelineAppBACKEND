
class UsersController < ApplicationController

    def create
        @user = User.new(user_params)
    end

    def login
        @user = User.find_by_username((params[:params])[:username])
        p params[:params]
        if @user.authenticate((params[:params])[:password])
            @user.regenerate_session_token
            @user.save!
            return @user.session_token
        else
            redirect_to home_url
        end
    end

    private
        def user_params 
            params.require(:user).permit(:username, :password)
        end
end
