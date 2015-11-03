class AddWeightToCourseSkillset < ActiveRecord::Migration
  def change
  	add_column :course_skillsets, :Weight, :float
  end
end
