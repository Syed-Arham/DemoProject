class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.integer :amount
      t.string :type

      t.timestamps
    end
  end
end
