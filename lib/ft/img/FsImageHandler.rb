require 'active_support'
require 'img/IImageHandler.rb'

##
# File system image handler.
# Saves the images into the public/ directory of the app
# with a long-hash to preserve privacy of images.
class FsImageHandler < IImageHandler
 
  ## Create user specific image dir if not exit and return path.
  def userPath(name, ud)

    updir = File.join(Rails.root, "public", "uploads")
    Dir.mkdir(updir) unless File.exists? (updir)

    udir = File.join(updir, "user__#{ud.id}")
    Dir.mkdir(udir) unless File.exists? (udir)

    hash = Digest::SHA1.hexdigest(Time.now.to_s.split(//).sort_by {rand}.join)
    path = File.join(udir, "#{hash}#{File.extname(name)}")

    return path
  end

  ## 
  # Creates a new asset and returns it
  # @returns a new VAsset, possibly with errors.
  def create(file, name, project)

    asset = VAsset.new
    asset.v_project = project
    asset.v_user_data = project.v_user_data
    asset.path = userPath(name, asset.v_user_data)

    if asset.save
      File.open(asset.path, "wb") do |f|
        f.write file.read
      end
    end

    return asset
  end

  ## Destroys an asset instance and the image (where ever it's actually stored)
  def destroy(v_asset)
    File.delete(v_asset.path)
  end
end
