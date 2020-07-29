class SessionsController < ApplicationController
    def create
        @user = User.find_by(username: params[:session][:username])
        if @user
            session[:user_id] = @user.id
            flash[:success] = 'You have successfully logged in'
            redirect_to users_path
        else
            flash[:danger] = 'Error logging in'
            render 'new' 
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "You have logged out"
        redirect_to root_path
    end
end
