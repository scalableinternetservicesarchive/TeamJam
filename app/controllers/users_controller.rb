class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @courses = @user.courses
    @teams = @user.teams
    @course_team = Hash.new

    @courses.each do |course|
      @teams.each do |team|
        if team.course == course
          @course_team[course] = team
        end
      end
  end
  end

  def edit
  end
end
