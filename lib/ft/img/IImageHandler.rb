require 'util/Abstract.rb'

## API for handling uploaded images and converting them into VAssets
class IImageHandler
  include Abstract
  
  def initialize
    check
  end

  ## Creates a new asset and returns it
  def __create(file, name, project)
  end

  ## Destroys an asset instance and the image (where ever it's actually stored)
  def __destroy(v_asset)
  end
end
