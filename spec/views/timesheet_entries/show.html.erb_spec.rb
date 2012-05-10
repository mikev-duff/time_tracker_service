require 'spec_helper'

describe "timesheet_entries/show" do
  before(:each) do
    @timesheet_entry = assign(:timesheet_entry, stub_model(TimesheetEntry,
      :user_id => 1,
      :project_name => "Project Name",
      :task_name => "Task Name",
      :hours => 1.5,
      :notes => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Project Name/)
    rendered.should match(/Task Name/)
    rendered.should match(/1.5/)
    rendered.should match(/MyText/)
  end
end
