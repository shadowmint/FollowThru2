require 'test_helper'
 
class DbVPledgeTypeTest < ActiveSupport::TestCase

  test "can create and save instance" do
    instance = VPledgeType.new
    assert !instance.valid?, "Invalid instance was valid"

    asset = (VAsset.find_by_sql [ "SELECT * FROM v_assets WHERE v_user_data_id = ?", 1 ]).first
    project = (VProject.find_by_sql [ "SELECT * FROM v_projects WHERE v_user_data_id = ?", 1 ]).first
    ud = project.v_user_data

    instance.v_project = project
    instance.v_user_data = ud
    instance.v_asset = asset
    instance.cost = 99.00
    instance.name = "Hello"
    instance.desc = "World"

    assert instance.valid?, "Record should be valid but: #{instance.errors.messages}"
    assert instance.save, "Failed to save instance"
  end
end
