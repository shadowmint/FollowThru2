require 'test_helper'
 
class DbVGoalTest < ActiveSupport::TestCase

  test "can create and save instance" do
    instance = VGoal.new
    assert !instance.valid?, "Invalid instance was valid"

    project = VProject.find_by_sql [ "SELECT * FROM v_projects WHERE v_user_data_id = ?", 1 ]
    ud = project.first.v_user_data

    pt = VPledgeType.find_by_sql [ "SELECT * FROM v_pledge_types WHERE id = ?", 1 ]

    instance.v_project = project.first
    instance.v_user_data = ud
    instance.v_pledge_type = nil
    instance.cost = 100.00
    instance.count = 0

    assert instance.valid?, "Record should be valid but: #{instance.errors.messages}"

    instance.count = 1
    assert !instance.valid?, "Goal should not be valid if it has a count but no pledge type"

    instance.v_pledge_type = pt.first

    assert instance.valid?, "Record should be valid but: #{instance.errors.messages}"
    assert instance.save, "Failed to save instance"
  end

end
