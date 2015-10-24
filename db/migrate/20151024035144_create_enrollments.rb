class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.references :course, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :time_committment
      t.datetime :start_date
      t.datetime :finish_date

      t.timestamps null: false
    end
  end
end