class AddTotalAmountToLoans < ActiveRecord::Migration[6.1]
  def change
    add_column :loans, :total_amount, :integer
  end
end
