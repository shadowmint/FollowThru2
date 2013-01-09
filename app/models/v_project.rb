require 'validate/ProjectValidator'

class VProject < ActiveRecord::Base
  attr_accessible :desc, :name, :v_status, :v_pledge_types, :v_pledges, :v_assets, :v_goals, :v_payments
  after_save :check_create_status

  belongs_to :v_user_data
  has_one :v_asset
  has_one :v_status
  has_many :v_pledge_types
  has_many :v_pledges
  has_many :v_assets
  has_many :v_goals
  has_many :v_payments

  validates_presence_of :v_user_data
  validates :desc, :presence => true
  validates :name, :presence => true
  validates_with ProjectValidator, :fields => [ :v_user_data ]

  # Create a status record if one does not exist
  def check_create_status
    if self.v_status.nil?
      status = VStatus.new
      status.v_project = self
      status.v_user_data = self.v_user_data
      self.v_status = status
    end
  end
end
