class RemoveWeightFromCourseSkillset < ActiveRecord::Migration
  def change
  	remove_column :course_skillsets, :weight, :float
  end
end
