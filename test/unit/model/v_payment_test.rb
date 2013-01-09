require 'test_helper'
 
class DbVPaymentTest < ActiveSupport::TestCase

  test "can create and save instance" do
    instance = VPayment.new
    assert !instance.valid?, "Invalid instance was valid"

    project = VProject.find_by_sql [ "SELECT * FROM v_projects WHERE v_user_data_id = ?", 1 ]
    ud = project.first.v_user_data

    pl = VPledge.find_by_sql [ "SELECT * FROM v_pledges WHERE id = ?", 1 ]
    pl = pl.first
    pl.amount = 100

    instance.v_project = project.first
    instance.v_user_data = ud
    instance.v_pledge = pl
    instance.date = Time.now
    instance.amount = 99

    assert !instance.valid?, "Payment amount incorrect against pledge type not being tracked"

    instance.amount = 110

    assert instance.valid?, "Record should be valid but: #{instance.errors.messages}"
    assert instance.save, "Failed to save instance"
  end

end
