class SkillsController < ApplicationController
  def edit
    @skills = Skill.all
    @user_skill_rating = Hash.new
    @skills.each do |sk|
      @user_skill_rating[sk] = SkillRating.where(user_id: current_user.id, skill_id: sk.id).first.rating
    end
  end

  def update
    params[:skillset].each do |id, rating|
      @sr = SkillRating.where(skill_id: id.to_i, user_id: current_user).first
      @sr.rating  = rating.to_i
      @sr.save
    end
     flash[:notice] = "Your skills were updated successfully!"
     redirect_to root_path
  end

end
