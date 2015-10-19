class AddPasscodeToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :passcode, :string
  end
end
