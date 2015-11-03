class AddSkillWeightToCourseSkillSet < ActiveRecord::Migration
  def change
  	add_column :course_skillsets, :weight, :float
  end
end
