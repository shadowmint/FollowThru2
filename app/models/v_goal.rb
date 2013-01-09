require 'validate/GoalValidator'

class VGoal < ActiveRecord::Base
  attr_accessible :cost, :count

  belongs_to :v_user_data
  belongs_to :v_pledge_type
  belongs_to :v_project

  validates_presence_of :v_user_data
  validates_presence_of :v_project
  validates :cost, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :count, :presence => true, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  validates_with GoalValidator, :fields => [ :count, :v_pledge_type ]
end
