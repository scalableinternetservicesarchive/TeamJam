class CreateSkillRatings < ActiveRecord::Migration
  def change
    create_table :skill_ratings do |t|
      t.belongs_to :skill, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.integer :rating

      t.timestamps null: false
    end
  end
end
