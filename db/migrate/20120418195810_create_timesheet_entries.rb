class CreateTimesheetEntries < ActiveRecord::Migration
  def change
    create_table :timesheet_entries do |t|
      t.integer :user_id
      t.string :project_name
      t.string :task_name
      t.date :performed_on
      t.float :hours
      t.text :notes

      t.timestamps
    end
    add_index :timesheet_entries, [:user_id, :created_at]
  end
end
