require 'test_helper'
require 'img/FsImageHandler.rb'
 
class DbFsImageHandler < ActiveSupport::TestCase

  def project_setup
    project = VProject.new
    ud = VUserData.find_by_sql [ "SELECT * FROM v_user_data WHERE user_id = ?", 1 ]
    project.v_user_data = ud.first
    project.name = "Hello Kitty"
    project.desc = "This is a project"
    project.save
    return project
  end

  test "can record image instance" do

    handler = FsImageHandler.new

    file = File.open(File.join(Rails.root, "TODO"), 'r')
    project = project_setup

    asset = handler.create file, "Hello.png", project
    assert !asset.nil? && !asset.path.nil?, "Failed to create asset"
    assert asset.valid?, "Asset does not appear to be valid: #{asset.errors.messages}"

    path = asset.path
    handler.destroy asset
    assert !File.exists?(path), "Delete did not remove image instances"
  end

  test "deleting an asset deletes the image" do

    handler = FsImageHandler.new

    file = File.open(File.join(Rails.root, "TODO"), 'r')
    project = project_setup

    asset = handler.create file, "Hello.png", project
    path = asset.path

    assert File.exists?(path), "Did not create image instances"

    asset.destroy
    assert !File.exists?(path), "Delete did not remove image instances"
  end
end
