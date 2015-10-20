class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_user_info

  protected

   def after_sign_up_path_for(resource)
     '/join_classes/index'
  end

  def configure_permitted_parameters
    additional_params = [:first_name, :last_name, :sid, :major, :year]
    devise_parameter_sanitizer.for(:sign_up).concat(additional_params)
    devise_parameter_sanitizer.for(:account_update).concat(additional_params)
  end
  def get_user_info
    if user_signed_in?
    @courses = current_user.courses
    @teams = current_user.teams
    @course_team = Hash.new

    @courses.each do |course|
      @teams.each do |team|
        if team.course == course
          @course_team[course] = team
        end
      end
  end
  end
end
end
