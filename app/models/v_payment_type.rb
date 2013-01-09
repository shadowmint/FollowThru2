class VPaymentType < ActiveRecord::Base
  attr_accessible :name

  belongs_to :v_user_data

  validates_presence_of :v_user_data

  # Helper method to get the netbank payment type
  def self.Netbank 
    records = VPaymentType.find_by_sql([ "SELECT * FROM v_payment_types WHERE name = ?", "Netbank" ])
    rtn = records.count > 0 ? records.first : nil
    return rtn
  end

  # Helper method to get the cash payment type
  def self.Cash
    records = VPaymentType.find_by_sql([ "SELECT * FROM v_payment_types WHERE name = ?", "Cash" ])
    rtn = records.count > 0 ? records.first : nil
    return rtn
  end
end
