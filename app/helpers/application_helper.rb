module ApplicationHelper

   def active_page(active_page)
    @active == active_page ? "active" : ""
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

  def cache_key_course_team
    "#{current_user.id}-#{current_user.enrollments.maximum(:updated_at)}-#{current_user.team_memberships.maximum(:updated_at)}-#{current_user.enrollments.count}-#{current_user.team_memberships.count}"
  end

def cache_key_team(team, user_team)
  "#{team.id}-#{team.updated_at}-#{team.team_memberships.maximum(:updated_at)}-#{team.team_memberships.count}-#{(current_user && current_user.id) || 0}-#{(user_team && user_team.id) || 0}"
end
def cache_key_for_student_row(st, current_course, show_team, current_team, current_team_owner_id)
    tm = st.find_course_team(current_course)
    show = "0"
  if tm
    show = "#{tm.id}"
  end
  if show_team
    show = "#{show}-0-0"
  else
    show = "#{show}-1-#{current_team_owner_id}"
  end
  "st-#{st.id}-#{st.updated_at}-#{show}-#{(current_team && current_team.id) || 0}"
  end

end
