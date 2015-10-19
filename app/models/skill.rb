class Skill < ActiveRecord::Base
  has_many :skill_ratings
  has_many :students, :through => :skill_ratings, :class_name => 'User'
end
