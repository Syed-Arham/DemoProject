class AddMonthToLoans < ActiveRecord::Migration[6.1]
  def change
    add_column :loans, :month, :string
  end
end
