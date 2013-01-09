require 'test_helper'
require 'config/VLimits.rb'
 
class DbVProjectTest < ActiveSupport::TestCase

  test "can create and save instance" do
    project = VProject.new
    assert !project.valid?

    ud = VUserData.find_by_sql [ "SELECT * FROM v_user_data WHERE user_id = ?", 1 ]
    project.v_user_data = ud.first
    project.name = "Hello Kitty"
    project.desc = "This is a project"
    if !project.valid?
      puts project.errors.messages
    end
    assert project.valid?

    assert project.save
  end

  test "cannot create too many projects" do
    project = VProject.new
    assert !project.valid?

    ud = VUserData.find_by_sql [ "SELECT * FROM v_user_data WHERE user_id = ?", 1 ]

    for i in 1...VLimits::MAX_PROJECT_COUNT
      project = VProject.new
      project.v_user_data = ud.first
      project.name = "Hello Kitty"
      project.desc = "This is a project"
      assert project.save, "Record should be valid but: #{project.errors.messages}"
    end
    assert !project.save, "Able to save too many records: #{VProject.count}"
  end

  test "creating a project creates a status record" do
    project = VProject.new

    ud = VUserData.find_by_sql [ "SELECT * FROM v_user_data WHERE user_id = ?", 1 ]
    project.v_user_data = ud.first
    project.name = "Hello Kitty"
    project.desc = "This is a project"

    assert project.save
    assert !project.v_status.nil?, "After saving project, status was NULL"

    p = VProject.find_by_id project.id
    assert !p.v_status.nil?, "After loading project, status was NULL"
    assert p.v_status.status = VStatus::STATUS_NEW
  end

  test "deleting the user deletes all projects attached" do

    ud = VUserData.find_by_sql [ "SELECT * FROM v_user_data WHERE user_id = ?", 1 ]
    ud = ud.first

    count = VProject.all.count
    ud_count = ud.v_projects.count

    project = VProject.new
    project.v_user_data = ud
    project.name = "Hello Kitty"
    project.desc = "This is a project"
    project.save

    project = VProject.new
    project.v_user_data = ud
    project.name = "Hello Kitty 2"
    project.desc = "This is a project too"
    project.save

    assert VProject.all.count == count + 2, "Invalid count after adding new projects"
    assert ud.v_projects.count == ud_count + 2, "Invalid count on parent after adding new projects"

    ud.destroy

    assert VProject.all.count == count - ud_count, "Invalid count after destroying parent record"
  end

end
