class NotificationsController < ApplicationController
  def index
    @notifications = current_user.mailbox.notifications
  end

  def rate
    notif = current_user.mailbox.notifications.where(id: params[:id]).first
    notif.mark_as_deleted(current_user)
    @user = User.find(params[:user_id])
    flash[:notice] = "#{@user.first_name}'s ratings were updated based on your feedback!"
    redirect_to :back
  end

  def mark_as_read
    notif = current_user.mailbox.notifications.where(id: params[:id]).first
    notif.mark_as_deleted(current_user)
    redirect_to :back
  end

  def accept
    notif = current_user.mailbox.notifications.where(id: params[:id]).first
    sender = notif.sender
    team = Team.find_by_id(notif.attachment.to_i) #team should exist, check that too
      if notif.notification_code.to_i == 1  #accept students offer to join team, you are the owner
         if (team.students.count < team.course.max_members) && (sender.find_course_team(team.course) == false )
           team.students.each { |st|
             if st.id.to_i != team.team_owner_id.to_i
             st.notify("SUCCESS", " #{sender.first_name} was successfully added to your team #{team.name}",nil,true,5,false,nil)
             end
             }
        TeamMembership.create(team_id: team.id, user_id: sender.id)
        #current_user.notify("SUCCESS","#{sender.first} was successfully added to your team #{team.name}",nil,true,5,false,nil)
           flash[:notice] = "#{sender.first_name} was successfully added to your team #{team.name}"
        sender.notify("SUCCESS", " You were accepted to the team #{team.name}",nil,true,5,false,nil)
           else
           flash[:notice] = "Your team was full or #{sender.first_name} is in another team"
           end
      elsif notif.notification_code.to_i == 3 #accept team owners invitation to join his team
           if (team.students.count < team.course.max_members) && (current_user.find_course_team(team.course) == false )
             team.students.each { |st|
             st.notify( "SUCCESS", "#{current_user.first_name} has accepted the invitation  to join team #{team.name}",nil,true,5,false,nil )
             }
        TeamMembership.create(team_id: team.id, user_id: current_user.id)
       # current_user.notify("SUCCESS","You were successfully added to the team #{team.name}",nil,true,5,false,nil)
         flash[:notice] ="You were successfully added to the team #{team.name}"
             #sender.notify("SUCCESS","#{current_user.first_name} has accepted the invitation  to join team #{team.name}",nil,true,5,false,nil)
             else
             flash[:notice] = "Team was full or you are already in another team"
           end
        end
    notif.mark_as_deleted(current_user)
     redirect_to :back
  end

  def reject
    notif = current_user.mailbox.notifications.where(id: params[:id]).first
    sender = notif.sender
    team = Team.find_by_id(notif.attachment.to_i) #team should exist, check that too
    if notif.notification_code.to_i == 1 #reject students offer to join your team
     # current_user.notify("DENYING","#{sender.first} was denied permission to join your team #{team.name}",nil,true,6,false,nil)
      sender.notify("DENIED", "You were rejected from the team #{team.name}",nil,true,6,false,nil)
      flash[:notice] = "#{sender.first_name} was denied permission to join your team #{team.name}"

    elsif notif.notification_code.to_i == 3 # reject teams invitation to join
      sender.notify("DENIED","#{current_user.first_name} has rejected your invitation  to join team #{team.name}",nil,true,6,false,nil)
      flash[:notice] = "You rejected invitation to join the team #{team.name}"
    end
    notif.mark_as_deleted(current_user)
    redirect_to :back
  end
end
