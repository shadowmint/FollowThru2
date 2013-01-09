require 'factory/UserDataFactory.rb'

class ProjectRepo 

  def initialize(current_user)
    @ud = UserDataFactory::get current_user
  end

  def all
    rtn = VProject.where("v_user_data_id == ?", @ud.id)
    return rtn
  end

  def get(id)
    rtn = VProject.find(id)
    if rtn.v_user_data_id != @ud.id
      rtn = nil
    end
    return rtn
  end

  def new
    rtn = VProject.new
    rtn.v_user_data = @ud
    return rtn
  end

  def create(template)
    rtn = VProject.new({ 
      :name => template.name, 
      :desc => template.desc 
    })
    rtn.v_user_data = @ud
    rtn.save
    return rtn
  end

  def update(id, project)

    # Only allow some properties to be updated.
    params = {}
    params[:name] = project.name
    params[:desc] = project.desc
    if !project.v_asset.nil?; params[:v_asset_id] = project.v_asset.id end

    target = get(id)
    if !target.nil?
      return target.update_attributes(params)
    else
      return false
    end
  end

  def destroy(id)
    target = get(id)
    if !target.nil?
      target.destroy
    end
  end
end
