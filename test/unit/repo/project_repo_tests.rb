require 'test_helper'
require 'repo/ProjectRepo.rb'
 
class DbVProjectRepoTest < ActiveSupport::TestCase

  def current_user
    rtn = User.find_by_name "admin"
    return rtn
  end

  test "can create and save instance" do
    repo = ProjectRepo.new current_user
    project = repo.create VProject.new({ :name => "name", :desc => "desc" })
    assert project.valid?, "Project not valid: #{project.errors.messages}"

    project2 = repo.get project.id
    assert !project2.nil?, "Unable to fetch saved record"
  end

  test "can get all" do
    repo = ProjectRepo.new current_user
    project = repo.create VProject.new({ :name => "name", :desc => "desc" })
    project = repo.create VProject.new({ :name => "name", :desc => "desc" })
    project = repo.create VProject.new({ :name => "name", :desc => "desc" })

    projects = repo.all
    assert projects.count == 3, "Unable to fetch saved records"
  end

  test "can update" do
    repo = ProjectRepo.new current_user
    project = repo.create VProject.new({ :name => "name", :desc => "desc" })
    assert project.valid?, "Project not valid: #{project.errors.messages}"

    project.name = "Name2"
    repo.update project.id, project

    project2 = repo.get project.id
    assert project2.name == "Name2", "Did not update name correctly"
    assert project2.desc == "desc", "Did not update desc correctly"
  end

end
