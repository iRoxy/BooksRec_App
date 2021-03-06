class UsersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Stranger no longer! Welcome to Books Rec, #{@user.username}!"
            redirect_to books_path
        else
            render 'new'
        end
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end