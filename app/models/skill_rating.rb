class SkillRating < ActiveRecord::Base
  belongs_to :skill
  belongs_to :student, :class_name => 'User', :foreign_key => 'user_id'
end
