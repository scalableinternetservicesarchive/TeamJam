class ChangeRatingsInSkillRatings < ActiveRecord::Migration

   def up
     change_column :skill_ratings, :rating, :real
    end

  def down
    change_column :skill_ratings, :rating, :integer
  end

end
