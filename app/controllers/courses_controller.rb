class CoursesController < ApplicationController
  before_action :authenticate_user!

  def rate_members
    course = Course.find(params[:id])
    Team.where(course_id: course.id).each {|t| t.send_rating_notif}
    flash[:notice] = "All students were asked to rate their teammates"
    redirect_to root_path
  end

  def new
     @skills = Skill.all
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.instructor_id = current_user.id
    if @course.save
      params[:skillset].each do |id, rating|
        puts rating.to_i
        if rating.to_i > 0
       CourseSkillset.create(course_id: @course.id, skill_id: id.to_i, min_rating: rating.to_i)
        end
    end
      flash[:notice] = "Course successfully created!"
      redirect_to course_path(@course)
    else
      render 'new'
    end
  end

  def edit
  end

  def edit_time_commitment
    course = Course.find(params[:id])
    enroll = Enrollment.where(user_id: current_user.id, course_id: course.id).first
    enroll.time_commitment = params[:time].to_i
    if enroll.save
      flash[:notice] = "Time Commitment updated successfully"
    else
      flash[:notice] = "Bad Time value supplied"
    end
    redirect_to root_path
  end

  def join
    @course = Course.find(params[:id])
    Enrollment.create(course_id: @course.id.to_i, user_id: current_user.id, time_commitment: 2)
    flash[:notice] = "You were successfully added to the course"
    redirect_to root_path
  end

  def leave
    @course = Course.find(params[:id])
    Enrollment.where(course_id: @course.id.to_i, user_id: current_user.id).first.destroy
    flash[:notice] = "You were removed from the course"
    redirect_to root_path
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
    redirect_to root_path
  end

  def show
    @course = Course.find(params[:id])
    @enrolled = false
    @instr = false
    inst = User.find_by_id(@course.instructor_id.to_i)
    if inst
      if inst.id == current_user.id
        @instr = true
      end
    end
    if current_user.courses.include?(@course)
    @enrolled = true
    @user_course_team = current_user.find_course_team(@course)
    @time = current_user.enrollments.where(course_id: @course.id).first.time_commitment
    end
      @ordered_students = @course.students
    if(params[:order_skill].present?)
      students_ids = @ordered_students.collect{ |st| st.id }
      id = params[:order_skill]
      if id.to_i == -1 #order by time commitment
          ratings = Enrollment.where(course_id: @course.id).order(time_commitment: :desc)
      elsif id.to_i != -2
          ratings = SkillRating.where(skill_id: id).where("user_id IN (?)", students_ids).order(rating: :desc) #order by individual skills
      end
      if id.to_i == -2
          @ordered_students = Course.find(params[:id]).students.sort_by{|obj| obj.overall_rating(params[:id])}.reverse!
      else
          @ordered_students = ratings.collect{|r| User.find(r.user_id)}
      end
    end
  end

  def course_params
    params.require(:course).permit(:name, :description, :max_members, :min_time_commitment, :start_date, :end_date)
  end

  def search

  end
end
