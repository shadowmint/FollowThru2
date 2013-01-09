require 'config/VImpl.rb'

class VAsset < ActiveRecord::Base
  attr_accessible :path

  belongs_to :v_user_data
  belongs_to :v_project

  validates_presence_of :v_user_data
  validates_presence_of :v_project
  validates :path, :presence => true

  def destroy_path
    path = self.path
    if (!path.nil?) && (File.exists? (path))
      handler = VImpl.IImageHandler.new
      handler.destroy(self)
    end
  end

  before_destroy :destroy_path
end
