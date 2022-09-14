class AddInstallmentsRemainingToLoans < ActiveRecord::Migration[6.1]
  def change
    add_column :loans, :installments_remaining, :integer
  end
end
