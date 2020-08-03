class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]
  before_action :require_user

  def index
    @groups = current_user.groups.order('name ASC')
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      flash[:success] = 'Group was created successfully'
      redirect_to @group
    else
      flash.now[:danger] = 'Group was not created'
      render 'new'
    end
  end

  def show
    if current_user.groups.include? set_group
      @group = set_group
      @expenses = set_group.expenses
      @expense_user = true
    else
      flash[:danger] = 'You are not allowed to view other users groups'
    end
  end

  def edit; end

  def update
    if @group.update(group_params)
      flash[:success] = 'Group name was successfully updated'
      redirect_to group_path(@group)
    else
      flash.now[:danger] = 'Group was not updated'
      render 'edit'
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name)
  end
end
