class CoursesController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def new
  end

  def edit
  end

  def show
    @course = Course.find(params[:id])
    @user_course_team = current_user.find_course_team(@course)
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
