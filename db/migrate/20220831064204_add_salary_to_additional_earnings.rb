class AddSalaryToAdditionalEarnings < ActiveRecord::Migration[6.1]
  def change
    add_reference :additional_earnings, :salary, null: false, foreign_key: true
  end
end
