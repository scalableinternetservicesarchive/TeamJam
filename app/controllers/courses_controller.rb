class CoursesController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def new
  end

  def edit
  end

  def invite
    @user = User.find(params[:id])
    @team = Team.find_by_id(params[:team_id])
    # make notif
    recp = @user.notify("INVITE","asdf",nil,true,1,false,current_user)
    notif = @user.mailbox.notifications.where(id: recp.notification_id).first
    notif.attachment = @team.id
    notif.body =  "#{current_user.first_name} #{current_user.last_name} has invited you to join his team #{@team.name}!"
    notif.save
    flash[:notice] = "#{@user.first_name} was notified of your interest!"
    redirect_to :back
  end

  def show
    @course = Course.find(params[:id])
    @user_course_team = current_user.find_course_team(@course)
    @ordered_students = @course.students
    if(params[:order_skill].present?)
      students_ids = @ordered_students.collect{ |st| st.id }
      id = params[:order_skill]
      ratings = SkillRating.where(skill_id: id).where("user_id IN (?)", students_ids).order(rating: :desc)
      @ordered_students = ratings.collect{|r| User.find(r.user_id)}
    end
   # @user_team_ships = TeamMembership.where(user_id: current_user.id)
   # @user_teams = @user_team_ships.collect {|ship| ship.team}
   # @user_course_team = false
   # @user_teams.each do |tm|
    #  if tm.course_id == @course.id
     #   @user_course_team = tm
      #  break
     # end
    #end
  end
end
