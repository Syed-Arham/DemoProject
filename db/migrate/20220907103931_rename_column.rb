class RenameColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :loans, :type, :loan_type
  end
end
