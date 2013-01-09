require 'test_helper'
 
class DbVAssetTest < ActiveSupport::TestCase

  test "can create and save instance" do
    asset = VAsset.new
    assert !asset.valid?, "Invalid asset was valid"

    project = VProject.find_by_sql [ "SELECT * FROM v_projects WHERE v_user_data_id = ?", 1 ]
    ud = project.first.v_user_data

    asset.v_project = project.first
    asset.v_user_data = ud
    asset.path = "/home/doug"

    if (!asset.valid?)
      print "Unexpected invalid errors: #{asset.errors.messages}"
    end
    assert asset.valid?, "Not valid when asset should be valid"
    assert asset.save, "Failed to save asset"
  end

end
