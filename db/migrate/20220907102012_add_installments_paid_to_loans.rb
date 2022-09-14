class AddInstallmentsPaidToLoans < ActiveRecord::Migration[6.1]
  def change
    add_column :loans, :installments_paid, :integer
  end
end
