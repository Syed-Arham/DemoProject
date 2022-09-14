class AddSalaryToAdditionalDeductions < ActiveRecord::Migration[6.1]
  def change
    add_reference :additional_deductions, :salary, null: false, foreign_key: true
  end
end
