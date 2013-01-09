require 'test_helper'
require 'config/VImpl.rb'
 
class VImplTest < ActiveSupport::TestCase
  test "can create image helper" do
    instance = VImpl.IImageHandler.new
    assert !instance.nil?, "Unable to create image handler"
  end
end
