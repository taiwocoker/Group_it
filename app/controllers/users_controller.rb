class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # before_action :require_user
  
  def index
    @users = User.all

  end

  def show
    @expenses = @user.expenses.all
  end

  def new
    @user = User.new
  end

  def edit
  end


  def create
    @user = User.new(user_params)

      if @user.save
        session[:author_id] = @user.id
         flash[:success] = 'Welcome to Group-It #{@users.username}'
        redirect_to login_path
      else
        render :new
      end
  
  end

  
  

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :image)
    end
end