class PreviousCourseController < ApplicationController
  def show
  	@today = DateTime.now
  	@prev_courses = current_user.courses.where("end_date < ?", @today)
  end
end
