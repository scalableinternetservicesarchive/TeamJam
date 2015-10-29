class AddTimeCommitmentToEnrollment < ActiveRecord::Migration
  def change
    add_column :enrollments, :time_commitment, :integer
  end
end
