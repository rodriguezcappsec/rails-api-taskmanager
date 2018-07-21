class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.date   :start_date
      t.string :status

      t.timestamps
    end
  end
end
