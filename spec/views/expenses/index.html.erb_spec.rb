require 'rails_helper'

RSpec.describe "expenses/index", type: :view do
  before(:each) do
    assign(:expenses, [
      Expense.create!(
        name: "Name",
        amount: 2
      ),
      Expense.create!(
        name: "Name",
        amount: 2
      )
    ])
  end

  it "renders a list of expenses" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
