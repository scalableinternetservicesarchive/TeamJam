class NotificationsController < ApplicationController
  def index
    @notifications = current_user.mailbox.notifications.paginate(:page => params[:page], :per_page => 10)
  end
  
  def polling
   @num_notif = current_user.mailbox.notifications.count
     respond_to do |format|
   # format.html
    format.js
     end
  end

  def is_number? string
  true if Float(string) rescue false
end

  def rate
    alpha = 0.25
    notif = current_user.mailbox.notifications.where(id: params[:id]).first
    notif.mark_as_deleted(current_user)
    @user = User.find(params[:user_id])
    params[:skillset].each do |id, rating|
      if is_number?(id)
       @sr = SkillRating.where(skill_id: id.to_i, user_id: @user.id).first
      @sr.rating  = @sr.rating*(1-alpha) + rating.to_i*alpha
        @sr.reviews = @sr.reviews + 1
      @sr.save
       else
         if @user.dependability == 0
         @user.dependability = rating.to_i
         else
            @user.dependability =  @user.dependability*(1-alpha) + alpha*rating.to_i
         end
         @user.reviews = @user.reviews + 1
         @user.save
       end
      end
    flash[:notice] = "#{@user.first_name}'s ratings were updated based on your feedback!"
    notif.destroy
    redirect_to :back
  end

  def mark_as_read
   notif = current_user.mailbox.notifications.where(id: params[:id]).first
    @notif_id = params[:id]
    notif.destroy
     respond_to do |format|
    format.html
    format.js
  end
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
    #notif.mark_as_deleted(current_user)
    notif.destroy
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
    #notif.mark_as_deleted(current_user)
    notif.destroy
    redirect_to :back
  end
end
