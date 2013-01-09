require 'test_helper'
 
class DbVPledgeTest < ActiveSupport::TestCase

  test "can create and save instance" do
    instance = VPledge.new
    assert !instance.valid?, "Invalid instance was valid"

    project = VProject.find_by_sql [ "SELECT * FROM v_projects WHERE v_user_data_id = ?", 1 ]
    ud = project.first.v_user_data

    pt = VPledgeType.find_by_sql [ "SELECT * FROM v_pledge_types WHERE id = ?", 1 ]
    pt.first.cost = 99.00

    instance.v_project = project.first
    instance.v_user_data = ud
    instance.v_pledge_type = pt.first
    instance.amount = 100.00
    instance.cancelled = false
    instance.reminder = 0

    assert instance.valid?, "Record should be valid but: #{instance.errors.messages}"

    instance.amount = 98
    assert !instance.valid?, "Pledge should not be valid if the amount is lower than the pledge type"

    instance.amount = 99.00
    assert instance.valid?, "Record should be valid but: #{instance.errors.messages}"
    assert instance.save, "Failed to save instance"
  end

end
