class UsersController < ApplicationController
  before_action :authenticate_user!



  def invite
    @user = User.find(params[:id])
    puts("inviting #{@user.first_name}")
    @team = Team.find_by_id(params[:team_id])
    # make notif
    recp = @user.notify("INVITE","asdf",nil,true,3,false,current_user)
    notif = @user.mailbox.notifications.where(id: recp.notification_id).first
    notif.attachment = @team.id
    notif.body =  "#{current_user.first_name} #{current_user.last_name} has invited you to join his team #{@team.name}!"
    notif.save
    flash[:notice] = "#{@user.first_name} was notified of your interest!"
    redirect_to root_path
  end

  def show
    @user = User.find(params[:id])
    @courses = @user.courses
    @teams = @user.teams
    @course_team = Hash.new

    @skills = Skill.all
    @user_skill_rating = Hash.new
    @user_skill_reviews = Hash.new
    @skills.each do |sk|
      arr = SkillRating.where(user_id: @user.id, skill_id: sk.id)
      if arr.count == 0
        SkillRating.create(user_id: @user.id, skill_id: sk.id, rating: 0, reviews: 0)
         @user_skill_rating[sk] = 0
        @user_skill_reviews[sk] = 0
      else
        @user_skill_rating[sk] = arr.first.rating.round()
        @user_skill_reviews[sk] = arr.first.reviews
      end
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
