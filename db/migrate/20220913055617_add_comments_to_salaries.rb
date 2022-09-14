class AddCommentsToSalaries < ActiveRecord::Migration[6.1]
  def change
    add_column :salaries, :comments, :string
  end
end
