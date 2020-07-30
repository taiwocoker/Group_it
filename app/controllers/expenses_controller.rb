class ExpensesController < ApplicationController
  before_action :set_expense, only: [:show, :edit, :update, :destroy]
  before_action :require_user
  # GET /expenses
  # GET /expenses.json
  def index
    @expenses = Expense.all
    @expense = Expense.new
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
    @expenses = Expense.all
  end

  def edit
  end

  def create
    @expense = current_user.expenses.build(expense_params)
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
    if @expense.update(activity_params)
      flash[:success] = 'Expense updated successfully!'
      redirect_to expenses_path
    else
      flash.now[:danger] = 'expense wasn`t updated'
      render :edit
    end
  end

  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_url, notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_expense
      @expense = Expense.find(params[:id])
    end

    def expense_params
      params.require(:expense).permit(:name, :amount, group_ids: [])
    end
end
