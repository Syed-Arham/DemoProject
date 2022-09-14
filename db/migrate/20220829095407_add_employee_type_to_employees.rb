class AddEmployeeTypeToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :employee_type, :Boolean
  end
end
