class CreateAdditionalDeductions < ActiveRecord::Migration[6.1]
  def change
    create_table :additional_deductions do |t|
      t.integer :loan
      t.integer :parking
      t.integer :penalty

      t.timestamps
    end
  end
end
