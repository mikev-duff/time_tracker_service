class TimesheetEntry < ActiveRecord::Base
  attr_accessible :hours, :notes, :performed_on, :project_name, :task_name
  belongs_to :user
  validates :user_id, presence: true
  validates :project_name, presence: true
  validates :hours, presence: true

  default_scope order: 'timesheet_entries.created_at DESC'

end
