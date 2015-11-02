class AddProfToUsers < ActiveRecord::Migration
  def change
    add_column :users, :prof, :boolean, default: false
  end
end
