require 'test_helper'
require 'repo/ProjectRepo.rb'
require 'repo/AssetRepo.rb'
 
class DbVAssetRepoTest < ActiveSupport::TestCase

  def current_user
    rtn = User.find_by_name "admin"
    return rtn
  end

  def setup 
    repo = ProjectRepo.new current_user
    project = repo.create VProject.new({ :name => "name", :desc => "desc" })

    rtn = AssetRepo.new current_user, project
    return rtn
  end

  test "can create and save asset" do
    extend ActionDispatch::TestProcess
    repo = setup
    file = fixture_file_upload("img/img1.jpg", 'image/jpg', :binary)
    asset = repo.create file
    assert !asset.nil?, "Asset was not created as required"
    assert asset.valid?, "Created asset was not valid"
    repo.destroy asset.id
  end

  test "can fetch assets" do
    extend ActionDispatch::TestProcess
    repo = setup

    file = fixture_file_upload("img/img1.jpg", 'image/jpg', :binary)
    asset = repo.create file
    asset = repo.create file
    asset = repo.create file
    asset = repo.create file

    assets = repo.all
    assert assets.count == 4, "Invalid count after inserting records"

    assets.each do |a|
      repo.destroy a.id
    end
  end

  test "can get asset" do
    extend ActionDispatch::TestProcess
    repo = setup

    file = fixture_file_upload("img/img1.jpg", 'image/jpg', :binary)
    asset = repo.create file
    asset = repo.create file
    asset = repo.create file
    id = asset.id 
    asset = repo.create file

    asset = repo.get id
    assert !asset.nil?, "Unable to fetch record instance"

    assets = repo.all
    assets.each do |a|
      repo.destroy a.id
    end
  end
end
