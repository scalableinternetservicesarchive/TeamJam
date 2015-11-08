class ChangeRatingsInCourseSkillset < ActiveRecord::Migration
  def up
     change_column :course_skillsets, :min_rating, :real
    end

  def down
    change_column :course_skillsets, :min_rating, :integer
  end
end
