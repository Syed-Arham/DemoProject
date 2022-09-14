class AddInstallmentsToLoans < ActiveRecord::Migration[6.1]
  def change
    add_column :loans, :installments, :integer
  end
end
