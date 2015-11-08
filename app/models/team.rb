class Team < ActiveRecord::Base
  belongs_to :course
  has_many :team_memberships
  has_many :students, :through => :team_memberships, :class_name => 'User'

  validates :passcode, presence: true

  def send_rating_notif
    if team.course.skills.count > 0
    self.students.each { |st|
      self.students.each { |other_st|
        if other_st.id != st.id
          recp =  st.notify( "RATING", "Please rate #{other_st.first_name}'s skill performance in the team #{self.name}",nil,true,10,false, other_st)
          notif = st.mailbox.notifications.where(id: recp.notification_id).first
          notif.attachment = self.id
          notif.save
        end
          }
      }
  end
  end
end
