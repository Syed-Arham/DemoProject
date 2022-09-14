class AddOtherBonusToAdditionalEarnings < ActiveRecord::Migration[6.1]
  def change
    add_column :additional_earnings, :other_bonus, :integer
  end
end
