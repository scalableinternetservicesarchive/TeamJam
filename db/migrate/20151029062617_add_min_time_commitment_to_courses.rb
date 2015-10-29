class AddMinTimeCommitmentToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :min_time_commitment, :integer
  end
end
