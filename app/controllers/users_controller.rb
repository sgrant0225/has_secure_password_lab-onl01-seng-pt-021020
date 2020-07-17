class UsersController < ApplicationController

    def new
        if logged_in
            redirect_to "/welcome"
        else
            render :signup
        end
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to '/welcome'
        else
            redirect_to '/signup'
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end

end
