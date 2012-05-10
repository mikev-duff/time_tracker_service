require 'spec_helper'

describe "timesheet_entries/new" do
  before(:each) do
    assign(:timesheet_entry, stub_model(TimesheetEntry,
      :user_id => 1,
      :project_name => "MyString",
      :task_name => "MyString",
      :hours => 1.5,
      :notes => "MyText"
    ).as_new_record)
  end

  it "renders new timesheet_entry form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => timesheet_entries_path, :method => "post" do
      assert_select "input#timesheet_entry_user_id", :name => "timesheet_entry[user_id]"
      assert_select "input#timesheet_entry_project_name", :name => "timesheet_entry[project_name]"
      assert_select "input#timesheet_entry_task_name", :name => "timesheet_entry[task_name]"
      assert_select "input#timesheet_entry_hours", :name => "timesheet_entry[hours]"
      assert_select "textarea#timesheet_entry_notes", :name => "timesheet_entry[notes]"
    end
  end
end
