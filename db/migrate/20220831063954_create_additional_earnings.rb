class CreateAdditionalEarnings < ActiveRecord::Migration[6.1]
  def change
    create_table :additional_earnings do |t|
      t.integer :bonus

      t.timestamps
    end
  end
end
