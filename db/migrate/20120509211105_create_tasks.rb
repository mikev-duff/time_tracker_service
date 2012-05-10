class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.date :performed_on
      t.float :hours
      t.text :notes
      t.references :user
      t.references :project

      t.timestamps
    end
    add_index :tasks, :user_id
    add_index :tasks, :project_id
  end
end
