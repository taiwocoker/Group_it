class CreateExpenseGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :expense_groups do |t|
      t.integer :expense_id
      t.integer :group_id
    end
  end
end
