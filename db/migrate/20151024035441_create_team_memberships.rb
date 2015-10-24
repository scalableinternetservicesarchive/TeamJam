class CreateTeamMemberships < ActiveRecord::Migration
  def change
    create_table :team_memberships do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :team, index: true, foreign_key: true
      t.text :feedback

      t.timestamps null: false
    end
  end
end