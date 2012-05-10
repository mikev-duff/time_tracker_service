require 'spec_helper'

describe TimesheetEntry do
  let(:user) { FactoryGirl.create(:user) }
  before { @timesheet_entry = user.timesheet_entries.build(project_name: "Nest", hours: 1) }

  subject { @timesheet_entry }

  it { should respond_to(:project_name) }
  it { should respond_to(:user_id) }
  it { should respond_to(:hours) }

  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @timesheet_entry.user_id = nil }
    it { should_not be_valid }
  end

  describe "when project_name is not present" do
    before { @timesheet_entry.project_name = nil }
    it { should_not be_valid }
  end

  describe "when hours is not present" do
    before { @timesheet_entry.hours = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        TimesheetEntry.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

end