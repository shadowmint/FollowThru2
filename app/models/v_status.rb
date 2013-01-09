class VStatus < ActiveRecord::Base
  attr_accessible :cost_progress, :cost_status, :cost_total, :end_time, :items_progress, :items_status, :items_total, :start_time, :status

  belongs_to :v_user_data
  belongs_to :v_project

  validates_presence_of :v_user_data
  validates_presence_of :v_project
  validates :cost_total, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :cost_progress, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
  validates :cost_status, :presence => true, :numericality => { :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100 }
  validates :items_total, :presence => true, :numericality => { :integer_only => true, :greater_than_or_equal_to => 0 }
  validates :items_progress, :presence => true, :numericality => { :integer_only => true, :greater_than_or_equal_to => 0 }
  validates :items_status, :presence => true, :numericality => { :integer_only => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100 }
  validates :start_time, :presence => true
  validates :end_time, :presence => true
  validates :status, :presence => true, :numericality => { :integer_only => true }

  after_initialize :set_default_values

  # Different status types
  STATUS_NEW = 0 
  STATUS_ACTIVE = 1
  STATUS_SUCCESS = 2
  STATUS_DEAD = 3

  def set_default_values
    if self.new_record?
      self.cost_total = 0
      self.cost_progress = 0
      self.cost_status = 0
      self.items_total = 0
      self.items_progress = 0
      self.items_status = 0
      self.start_time = 0
      self.end_time = 0
      self.status = STATUS_NEW
    end
  end
end
