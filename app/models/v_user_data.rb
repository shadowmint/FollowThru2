class VUserData < ActiveRecord::Base
  belongs_to :user
  has_many :v_projects, :dependent => :destroy
  validates_presence_of :user
end
