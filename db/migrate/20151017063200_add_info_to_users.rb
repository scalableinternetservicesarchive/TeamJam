class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :sid, :integer
    add_column :users, :major, :string
    add_column :users, :year, :integer
  end
end
