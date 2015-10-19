class JoinClassesController < ApplicationController
  def index
    @courses = Course.all
  end

  def join_courses
    params[:all_courses].each do |course, id|
        Enrollment.create(course_id: id.to_i, user_id: current_user.id)
    end
    redirect_to root_path
  end

end
