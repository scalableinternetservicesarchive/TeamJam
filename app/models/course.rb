class Course < ActiveRecord::Base
  has_many :enrollments
  has_many :students, :through => :enrollments, :class_name => 'User'
  has_many :teams
end
