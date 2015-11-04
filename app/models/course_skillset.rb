class CourseSkillset < ActiveRecord::Base
  belongs_to :course
  belongs_to :skill
 # validates :weight, :numericality => { :less_than => 1 }
end
