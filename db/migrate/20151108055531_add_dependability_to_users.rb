class AddDependabilityToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dependability, :real
  end
end
