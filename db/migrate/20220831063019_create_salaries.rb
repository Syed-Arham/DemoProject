class CreateSalaries < ActiveRecord::Migration[6.1]
  def change
    create_table :salaries do |t|
      t.string :month
      t.integer :year
      t.integer :totalsalary
      t.date :date

      t.timestamps
    end
  end
end
