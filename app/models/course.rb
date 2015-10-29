class Course < ActiveRecord::Base
  has_many :enrollments
  has_many :students, :through => :enrollments, :class_name => 'User'
  has_many :teams
  has_many :course_skillsets
  has_many :skills, :through => :course_skillsets
end
