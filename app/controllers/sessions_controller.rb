class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user
      session[:author_id] = @user.id
      flash[:success] = 'Successfully logged in.'
      redirect_to @user
    else
      flash.now[:danger] = 'Error logging in.'
      render 'new'
    end
  end

  def destroy
    session[:author_id] = nil
    redirect_to root_path, notice: 'Logged out!'
  end
end
