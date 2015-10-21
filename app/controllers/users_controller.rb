class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @courses = @user.courses
    @teams = @user.teams
    @course_team = Hash.new

    @skills = Skill.all
    @user_skill_rating = Hash.new
    @skills.each do |sk|
      @user_skill_rating[sk] = SkillRating.where(user_id: @user.id, skill_id: sk.id).first.rating
    end
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
