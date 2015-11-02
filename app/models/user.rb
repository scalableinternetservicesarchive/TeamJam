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
     self.teams.each do |tm|
       if tm.course == current_course
         return tm
       end
     end
    return false
  end

  def overall_rating(current_course_id)  #course.skill_set and self.skill_rating with same skill_id
    # overall_rate = 0
    skill_set = CourseSkillset.select("skill_id", "weight").where("course_id = ?", current_course_id)
    # self.skill_ratings.each do |sk_rate|
    #     skill_weight = 
    #     overall_rate += sk_rate.rating.to_f * sk_rate.weight
    # end
    overall_rate = self.skill_ratings.select { |rating| skill_set.select { |skill| skill.skill_id == rating.skill_id }.present?  }.inject(0) { |sum, rating| sum = sum + rating.rating.to_f * skill_set.select { |skill| skill.skill_id == rating.skill_id }.first.weight }
    return overall_rate
  end


  def sorted_by_overall_rating(stuA, stuB, current_course_id)
    if stuA.overall_rating(current_course_id) < stuB.overall_rating(current_course_id)
      return -1
    elsif stuA.overall_rating(current_course_id) == stuB.overall_rating(current_course_id)
      return 0
    else
      return 1
    end
  end
end
