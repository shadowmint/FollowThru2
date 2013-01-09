class VPledgeType < ActiveRecord::Base
  attr_accessible :cost, :desc, :name

  belongs_to :v_user_data
  belongs_to :v_asset
  belongs_to :v_project

  validates_presence_of :v_user_data
  validates_presence_of :v_asset
  validates_presence_of :v_project
  validates :cost, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :desc, :presence => true
  validates :name, :presence => true
end
