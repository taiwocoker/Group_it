class GroupsController < ApplicationController
    def index
        @groups = Group.all
    end

    def new
        @group = Group.new
    end

    def create
        @group = Group.new(group_params)
        if @group.save
            flash[:success] = "Category was created successfully"
            redirect_to groups_path
        else
            render 'new'
        end
    end
    
    def show
        @group = Group.find(params[:id])
        @group_expenses = @group.expenses.all
    end

    def edit
        @group = Group.find(params[:id])
    end
        
    def update
         @group = group.find(params[:id])
        if @group.update(group_params)
            flash[:success] = "Group name was successfully updated"
            redirect_to group_path(@group)
        else
            render 'edit'
        end
    end
    
    private
    
    def group_params
       params.require(:group).permit(:name)
    end
        
end
