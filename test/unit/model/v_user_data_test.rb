require 'test_helper'
 
class DbVUserDataTest < ActiveSupport::TestCase

  test "can create and save instance" do
    ud = VUserData.new
    assert !ud.valid?

    admin = User.find_by_name "admin"

    ud.user = admin
    assert ud.valid?, "Invalid user data: #{ud.errors.messages}"

    assert ud.save
  end

end
