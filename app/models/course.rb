class Course < ActiveRecord::Base
  has_many :enrollments
  has_many :students, :through => :enrollments, :class_name => 'User'
  has_many :teams
  has_many :course_skillsets
  has_many :skills, :through => :course_skillsets
end

  def self.sorted_by_overall_rating(stuA, stuB, current_course_id)
    if stuA.overall_rating(current_course_id) < stuB.overall_rating(current_course_id)
      return -1
    elsif stuA.overall_rating(current_course_id) == stuB.overall_rating(current_course_id)
      return 0
    else
      return 1
    end
  end

