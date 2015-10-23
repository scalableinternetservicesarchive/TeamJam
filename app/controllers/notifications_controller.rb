class NotificationsController < ApplicationController
  def index
    @notifications = current_user.mailbox.notifications
  end

  def accept
    notif = current_user.mailbox.notifications.where(id: params[:id])
    sender = notif.sender
    team = Team.find_by_id(notif.attachment) #team should exist, check that too
    if (team.students.count < team.course.max_members) && (sender.find_course_team(team.course) == false )
      if notif.notification_code == 1  #accept students offer to join team, you are the owner
        TeamMembership.create(team_id: team.id, user_id: sender.id)
        #current_user.notify("SUCCESS","#{sender.first} was successfully added to your team #{team.name}",nil,true,5,false,nil)
        flash[:notice] = "#{sender.first} was successfully added to your team #{team.name}"
        sender.notify("SUCCESS", " You were accepted to the team #{team.name}",nil,true,5,false,nil)
      elsif notif.notification_code == 3 #accept team owners invitation to join his team
        TeamMembership.create(team_id: team.id, user_id: current_user.id)
       # current_user.notify("SUCCESS","You were successfully added to the team #{team.name}",nil,true,5,false,nil)
         flash[:notice] ="You were successfully added to the team #{team.name}"
        sender.notify("SUCCESS","#{current_user.first} has accepted your invitation  to join team #{team.name}",nil,true,5,false,nil)
        end
    else
      flash[:notice] = 'Team is either full or you are already in a team.'
  end
     redirect_to :back
  end

  def reject
    notif = current_user.mailbox.notifications.where(id: params[:id])
    sender = notif.sender
    team = Team.find_by_id(notif.attachment) #team should exist, check that too
    if notif.notification_code == 2 #reject students offer to join your team
     # current_user.notify("DENYING","#{sender.first} was denied permission to join your team #{team.name}",nil,true,6,false,nil)
      sender.notify("DENIED", "You were rejected from the team #{team.name}",nil,true,6,false,nil)
      flash[:notice] = "#{sender.first} was denied permission to join your team #{team.name}"

    elsif notif.notification_code == 4 # reject teams invitation to join
      sender.notify("DENIED","#{current_user.first} has rejected your invitation  to join team #{team.name}",nil,true,5,false,nil)
      flash[:notice] = "You rejected invitation to join the team #{team.name}"
    end
    redirect_to :back
  end
end
