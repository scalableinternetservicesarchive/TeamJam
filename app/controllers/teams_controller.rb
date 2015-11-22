class TeamsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def add_github
     @team = Team.find(params[:id])
    @team.github = params[:github]
    @team.save
    redirect_to team_path(@team)
  end

  def show
    @team = Team.find(params[:id])
    @course = @team.course
    #TODO: change database setting so min_time_commitment initialized as 0
    if @course.min_time_commitment == nil
      @course.min_time_commitment = 0
    end
  end

  def new
    @course = params[:course_id]
    @team = Team.new(:course_id => params[:course_id])
  end

  def leave
    @course = Course.find(params[:course_id])
    @team = Team.find(params[:id])
    TeamMembership.where(team_id: @team.id, user_id: current_user.id).destroy_all
    num_left = @team.students.count
    if num_left > 0
    @team.students.each { |st|
          st.notify( "TREACHERY", "#{current_user.first_name} has left your team #{@team.name}",nil,true,7,false,nil )
             }
    end
    if current_user.id == @team.team_owner_id
      if num_left == 0
            @team.destroy
      else
        @team.team_owner_id = @team.students.last.id
        @team.save
      end
    end
    redirect_to :back
  end

  def create
    @course = Course.find(params[:course_id])
    @team = Team.new(team_params)
    @team.team_owner_id = current_user.id
    @team.course = @course
    if @team.save
      #create membership for the student
      mship = TeamMembership.create(team_id: @team.id, user_id: current_user.id)

      redirect_to course_path(@course)
    else
      render 'new'
    end
  end

  def edit
  end

  def express_interest
    #find team owner(or everyone in the team), send a notification from the current user to them
    #user1.notify("DENY","SORRY BUT YOU WERE DENIED",nil,true,2,false,user2)
    @course = Course.find(params[:course_id])
    @team = Team.find(params[:id])
    @owner = User.find_by_id(@team.team_owner_id)
    recp = @owner.notify("OFFER","asdf",nil,true,1,false,current_user)
    notif = @owner.mailbox.notifications.where(id: recp.notification_id).first
    notif.attachment = @team.id
    notif.body =  "#{current_user.first_name} #{current_user.last_name} has expressed interest in joining your team #{@team.name} !"
    notif.save
   # @team.students.each do |student|
   #   student.notify("OFFER", "#{current_user.first_name} #{current_user.last_name} has expressed interest in joining your team !")
    #end

    flash[:notice] = "The team owner was notified of your interest!"
    redirect_to :back
  end

  def join
    @course = Course.find(params[:course_id])
    @team = Team.find(params[:id])
  end

  def join_try
    @course = Course.find(params[:course_id])
    @team = Team.find(params[:id])
    if(params[:register][:passcode] == @team.passcode)
      current_user.teams.each do |team|
        if team.students.include?(current_user) && (team.course.id == @course.id)
          TeamMembership.where(team_id: team.id, user_id: current_user.id).destroy_all
          if team.students.count == 0
            team.destroy
          end
          break
        end
      end
        TeamMembership.create(team_id: @team.id, user_id: current_user.id)
      flash[:notice] = "Successfuly joined Team #{@team.name}"
      redirect_to root_path
    else
      @error = "Wrong passcode"
      render 'join'
    end

  end

  private
  def team_params
    params.require(:team).permit(:name, :description, :passcode, :course_id)
  end

end
