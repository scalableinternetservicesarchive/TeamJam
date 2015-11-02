class SkillRating < ActiveRecord::Base
  belongs_to :skill
  belongs_to :student, :class_name => 'User', :foreign_key => 'user_id'
  
  def self.rating_name(index)
    rating_array = [['n00b',0],['Some Experience',1],['Experienced',2],['Pro',3]]
    if index == false
    return rating_array
    else
      return rating_array[index][0]
    end
  end

end
