class AddGithubToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :github, :string
  end
end
