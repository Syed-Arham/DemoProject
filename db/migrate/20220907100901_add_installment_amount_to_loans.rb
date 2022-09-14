class AddInstallmentAmountToLoans < ActiveRecord::Migration[6.1]
  def change
    add_column :loans, :installment_amount, :integer
  end
end
