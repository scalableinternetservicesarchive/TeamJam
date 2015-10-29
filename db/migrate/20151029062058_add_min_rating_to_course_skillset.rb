class AddMinRatingToCourseSkillset < ActiveRecord::Migration
  def change
    add_column :course_skillsets, :min_rating, :integer
  end
end
