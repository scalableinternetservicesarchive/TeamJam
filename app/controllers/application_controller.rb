class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_user_info
  helper_method :mailbox

  private

  def mailbox
    @mailbox ||= current_user.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end
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
    @courses_app = current_user.courses
    @teams_app = current_user.teams
    @course_team_app = Hash.new

    @courses_app.each do |course|
      @teams_app.each do |team|
        if team.course == course
          @course_team_app[course] = team
        end
      end
  end
  end
end
end
