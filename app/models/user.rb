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
end
