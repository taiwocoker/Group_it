class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  
  def index
    @expenses = current_user.expenses.desc.select{|expense| expense.groups.exists?}
  end

  def external
    @expenses = current_user.expenses.desc.reject { |expense| expense.groups.exists?}
  end

  def show
  end

  def new
    @expense = Expense.new
    @groups = current_user.groups
     @message = if @groups.size.zero?
      'If you want to choose a group for your expense, you should create a group before adding it.'
     else
      'Choose a group for your expense.'
     end
  end

  def edit
  end

  def create
    @expense = current_user.expenses.build(expense_params)
    @group = Group.find_by(id: group_params[:group_id])
    @expense.groups << @group unless @group.nil?
    # @expense.author = User.first
    if @expense.save
      flash[:success] = 'Expense created successfully!'
      redirect_to expenses_path
    else
      flash.now[:danger] = 'Expense wasn`t created'
      render :new
    end
  end

  def update
    if @expense.update(expense_params)
      flash[:success] = 'Expense updated successfully!'
      redirect_to expenses_path
    else
      flash.now[:danger] = 'expense wasn`t updated'
      render :edit
    end
  end

  def destroy
    @expense.destroy
    redirect_to expenses_path
  end

  private
    def set_expense
      @expense = Expense.find(params[:id])
    end

    def expense_params
      params.require(:expense).permit(:name, :amount, group_ids: [])
    end

    def group_params
      params.require(:expense).permit(:group_id)
    end
end
