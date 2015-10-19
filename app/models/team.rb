class Team < ActiveRecord::Base
  belongs_to :course
  has_many :team_memberships
  has_many :students, :through => :team_memberships, :class_name => 'User'
  
  validates :passcode, presence: true
end
