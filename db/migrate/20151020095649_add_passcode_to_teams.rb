class AddPasscodeToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :passcode, :string
    add_column :teams, :team_owner_id, :integer
  end
end
