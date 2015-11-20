class JoinClassesController < ApplicationController
  def index
    @all_course = Course.all
    fresh_when([@all_course, current_user.courses])
  end

  def join_courses
    params[:all_courses].each do |course, id|
      Enrollment.create(course_id: id.to_i, user_id: current_user.id, time_commitment: 2)
    end
    redirect_to root_path
  end

end
