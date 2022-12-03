class UsersController < ApplicationController
    def create
        @user = User.new(user_params)
    end

    def show
        @user = User.find_by(user_params)
    end
    private
        def user_params 
            params.require(:user).permit(:username, :password)
        end
end
