class AddSalaryToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :salary, :integer
  end
end
