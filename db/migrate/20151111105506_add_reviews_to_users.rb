class AddReviewsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :reviews, :integer, :default => 0
  end
end
