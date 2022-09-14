class AddEmployeeToSalaries < ActiveRecord::Migration[6.1]
  def change
    add_reference :salaries, :employee, null: false, foreign_key: true
  end
end
