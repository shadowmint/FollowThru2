require 'test_helper'
require 'factory/UserDataFactory.rb'
 
class DbUserDataFactoryTest < ActiveSupport::TestCase

  test "can get userdata instance" do

    admin = User.find_by_name "admin"

    ud = UserDataFactory::get admin

    assert !ud.nil?, "Failed to get user data record"
  end

  test "can create userdata instance" do

    user = User.new
    user.email = "adsfadf@gmail.com"
    user.password = "#4242342342"
    assert user.valid?, "#{user.errors.messages}"

    ud = UserDataFactory::get user

    assert !ud.nil?, "Failed to get user data record"
  end
end
