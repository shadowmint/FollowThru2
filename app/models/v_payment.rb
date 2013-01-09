require 'validate/PaymentValidator'

class VPayment < ActiveRecord::Base
  attr_accessible :amount, :date

  belongs_to :v_user_data
  belongs_to :v_pledge
  belongs_to :v_project

  validates_presence_of :v_user_data
  validates_presence_of :v_pledge
  validates_presence_of :v_project
  validates :amount, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :date, :presence => true
  validates_with PaymentValidator, :fields => [ :amount ]
end
