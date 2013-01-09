require 'factory/UserDataFactory.rb'

class AssetRepo 

  def initialize(current_user, project)
    @ud = UserDataFactory::get current_user
    @project = project
  end

  def all
    rtn = VProject.where("v_user_data_id == ? AND v_project_id == ?", [ @ud.id, @project.id ])
    return rtn
  end

  def get(id)
    rtn = VAsset.find(id)
    if rtn.v_user_data_id != @ud.id
      rtn = nil
    end
    return rtn
  end

  def new
    rtn = VAsset.new
    rtn.v_user_data = @ud
    rtn.v_project = @project
    return rtn
  end

  def create(file)
    handler = VImpl.IImageHandler.new
    rtn = handler.create file, file.original_filename, @project
    return rtn
  end

  def destroy(id)
    target = get(id)
    if !target.nil?
       target.destroy
    end
  end
end
