class Enrollment < ActiveRecord::Base
  belongs_to :course
  belongs_to :student, :class_name => 'User', :foreign_key => 'user_id'

  validates :time_commitment, :numericality => { :greater_than => -1 }
end
