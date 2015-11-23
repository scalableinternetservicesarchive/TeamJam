class User < ActiveRecord::Base
  require 'matrix'
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

  acts_as_messageable

  has_attached_file :prof_pic, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "itachi.jpg"
  validates_attachment_content_type :prof_pic, content_type: /\Aimage\/.*\Z/

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def mailboxer_email(object)
    self.email
  end

  def find_course_team(current_course)
     self.teams.includes(:course).each do |tm|            #
       if tm.course == current_course
         return tm
       end
     end
    return false
  end


  def overall_rating(current_course_id)  #course.skill_set and self.skill_rating with same skill_id
    # overall_rate = 0
    course = Course.find(current_course_id)
    skill_id_set = CourseSkillset.select("skill_id").where("course_id = ?", current_course_id).order(skill_id: :asc).map{|c| c.skill_id}
    min_ratings = CourseSkillset.select("min_rating").where("course_id = ?", current_course_id).order(skill_id: :asc).map{|c| c.min_rating}
    self_ratings = SkillRating.where(:user_id=>self.id).order(skill_id: :asc)

    user_ratings = Array.new
    self_ratings.each do |self_rate|
      if skill_id_set.include?(self_rate.skill_id)
        user_ratings.push(self_rate.rating)
      end
    end

    time_commit = Enrollment.where(course_id: current_course_id, user_id: self.id).first.time_commitment
    user_ratings.push(time_commit)
    min_ratings.push(course.min_time_commitment)

    user_ratings_matrix = Matrix.diagonal(*user_ratings)
    min_ratings_matrix = Matrix.diagonal(*min_ratings)

    user_ratings_matrix = user_ratings_matrix - min_ratings_matrix

    min_ratings_factor_matrix = Matrix.column_vector(min_ratings)

    results = user_ratings_matrix * min_ratings_factor_matrix

    overall = 0

    results.column(0) do |c|
      overall += c
    end

    return overall
  end


end
