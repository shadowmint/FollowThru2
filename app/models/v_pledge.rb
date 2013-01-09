require 'validate/PledgeValidator'

class VPledge < ActiveRecord::Base
  attr_accessible :amount, :cancelled, :reminder

  belongs_to :v_user_data
  belongs_to :v_pledge_type
  belongs_to :v_project

  validates_presence_of :v_user_data
  validates_presence_of :v_pledge_type
  validates_presence_of :v_project
  validates :amount, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :reminder, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
  validates_with PledgeValidator, :fields => [ :amount, :v_pledge_type ]
end
