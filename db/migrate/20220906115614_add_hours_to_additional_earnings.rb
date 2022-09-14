class AddHoursToAdditionalEarnings < ActiveRecord::Migration[6.1]
  def change
    add_column :additional_earnings, :hours, :integer
  end
end
