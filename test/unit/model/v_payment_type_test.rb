require 'test_helper'
 
class DbVPaymentTypeTest < ActiveSupport::TestCase

  test "can find payment types" do
    assert !VPaymentType.Netbank.nil?
    assert !VPaymentType.Cash.nil?
  end
end
