require 'spec_helper'

describe "timesheet_entries/index" do
  before(:each) do
    assign(:timesheet_entries, [
      stub_model(TimesheetEntry,
        :user_id => 1,
        :project_name => "Project Name",
        :task_name => "Task Name",
        :hours => 1.5,
        :notes => "MyText"
      ),
      stub_model(TimesheetEntry,
        :user_id => 1,
        :project_name => "Project Name",
        :task_name => "Task Name",
        :hours => 1.5,
        :notes => "MyText"
      )
    ])
  end

  it "renders a list of timesheet_entries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Project Name".to_s, :count => 2
    assert_select "tr>td", :text => "Task Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
