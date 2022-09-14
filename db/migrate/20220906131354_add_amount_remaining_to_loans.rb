class AddAmountRemainingToLoans < ActiveRecord::Migration[6.1]
  def change
    add_column :loans, :amount_remaining, :integer
  end
end
