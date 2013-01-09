require 'test_helper'
 
class DbVStatusTest < ActiveSupport::TestCase

  test "can create and save instance" do
    instance = VStatus.new
    assert !instance.valid?, "Invalid instance was valid"

    project = (VProject.find_by_sql [ "SELECT * FROM v_projects WHERE v_user_data_id = ?", 1 ]).first
    ud = project.v_user_data

    instance.v_project = project
    instance.v_user_data = ud
    instance.status = VStatus::STATUS_ACTIVE

    assert instance.valid?, "Record should be valid but: #{instance.errors.messages}"
    assert instance.save, "Failed to save instance"
  end
end
