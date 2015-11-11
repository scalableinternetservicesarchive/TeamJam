class ChangeDependInUsers < ActiveRecord::Migration
  def up
    change_column :users, :dependability, :real, :default => 10
  end

  def down
    change_column :users, :dependability, :real
  end
end
