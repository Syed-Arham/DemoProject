class AddFixedBonusToAdditionalEarnings < ActiveRecord::Migration[6.1]
  def change
    add_column :additional_earnings, :fixed_bonus, :integer
  end
end
