class AddReviewsToSkillRatings < ActiveRecord::Migration
  def change
    add_column :skill_ratings, :reviews, :integer, default: 0
  end
end
