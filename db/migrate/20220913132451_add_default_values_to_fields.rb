class AddDefaultValuesToFields < ActiveRecord::Migration[6.1]
  def up
    change_column_default :additional_deductions, :loan, 0
    change_column_default :additional_deductions, :parking, 0
    change_column_default :additional_deductions, :penalty, 0

    change_column_default :additional_earnings, :bonus, 0
    change_column_default :additional_earnings, :fixed_bonus, 0
    change_column_default :additional_earnings, :other_bonus, 0
    change_column_default :additional_earnings, :hours, 0
  end

  def down
    change_column_default :additional_deductions, :loan, nil
    change_column_default :additional_deductions, :parking, nil
    change_column_default :additional_deductions, :penalty, nil

    change_column_default :additional_earnings, :bonus, nil
    change_column_default :additional_earnings, :fixed_bonus, nil
    change_column_default :additional_earnings, :other_bonus, nil
    change_column_default :additional_earnings, :hours, nil
  end
end
