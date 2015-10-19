class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :enrollments
  has_many :courses, :through => :enrollments
  has_many :team_memberships
  has_many :teams, :through => :team_memberships
  has_many :skill_ratings
  has_many :skills, :through => :skill_ratings

  def find_course_team(current_course)
     self.teams.each do |tm|
       if tm.course == current_course
         return tm
       end
     end
    return false
  end
end
