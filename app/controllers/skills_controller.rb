class SkillsController < ApplicationController
  #require 'ostruct'
  def edit
    @skills = Skill.all
    @skillsett = Hash.new
    @skills.each do |sk|
      iid = sk.id
      @skillsett[sk.id] = SkillRating.where(user_id: current_user.id, skill_id: sk.id).first.rating.round()
    end
  end

  def update
    params[:skillset].each do |id, rating|
      @sr = SkillRating.where(skill_id: id.to_i, user_id: current_user).first
      if @sr.rating != rating.to_i
        @sr.reviews = 0
      end
      @sr.rating  = rating.to_i
      @sr.save
    end
     flash[:notice] = "Your skills were updated successfully!"
     redirect_to root_path
  end

end
