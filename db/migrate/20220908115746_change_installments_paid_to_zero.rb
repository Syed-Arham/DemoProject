class ChangeInstallmentsPaidToZero < ActiveRecord::Migration[6.1]
  def change
    change_column :loans, :installments_paid, :integer, default: 0
  end
end
