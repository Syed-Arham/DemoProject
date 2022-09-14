class CreateLoanEnteries < ActiveRecord::Migration[6.1]
  def change
    create_table :loan_entries do |t|
      t.integer :amount
      t.string :loan_type

      t.timestamps
    end
  end
end
