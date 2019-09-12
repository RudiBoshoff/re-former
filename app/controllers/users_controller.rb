class UsersController < ApplicationController
    def index
        # NOT PART OF INSTRUCTIONS
        @user = User.all
    end
    
    def create
        # MANUAL FORM
        # @user = User.new(username: params[:username], email: params[:email], password: params[:password])

        # FORM_TAG and FORM_FOR
        @user = User.new(user_params)

        if @user.save
            redirect_to users_path
        else
            render :new
        end
    end

    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.save
            @user.update(user_params)
            redirect_to users_path
        else
            render :edit
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
