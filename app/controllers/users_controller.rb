class UsersController < ApplicationController
    def create
        # MANUAL FORM
        # @user = User.new(username: params[:username], email: params[:email], password: params[:password])

        # FORM_TAG and FORM_FOR
        @user = User.new(user_params)

        if @user.save
            redirect_to new_user_path
        else
            render :new
        end
    end

    def new
        @user = User.new
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
