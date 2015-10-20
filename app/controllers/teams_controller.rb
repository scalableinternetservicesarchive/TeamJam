class TeamsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @course = params[:course_id]
    @team = Team.new(:course_id => params[:course_id])
  end

  def leave
    @course = Course.find(params[:course_id])
    @team = Team.find(params[:id])
    TeamMembership.where(team_id: @team.id, user_id: current_user.id).destroy_all
    if @team.students.count == 0
            @team.destroy
    end
    redirect_to :back
  end

  def create
    @course = Course.find(params[:course_id])
    @team = Team.new(team_params)
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
