class CreateCourseSkillsets < ActiveRecord::Migration
  def change
    create_table :course_skillsets do |t|
      t.references :course, index: true, foreign_key: true
      t.references :skill, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
