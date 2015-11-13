class Course < ActiveRecord::Base
  has_many :enrollments, dependent: :destroy
  has_many :students, :through => :enrollments, :class_name => 'User'
  has_many :teams, dependent: :destroy
  has_many :course_skillsets, dependent: :destroy
  has_many :skills, :through => :course_skillsets
  has_one :instructor, :class_name => 'User', :foreign_key => 'instructor_id'
  validates :min_time_commitment, presence: true
  validates :max_members, presence: true
end

  

