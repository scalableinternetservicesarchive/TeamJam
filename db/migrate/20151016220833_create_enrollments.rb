class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.belongs_to :course, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.integer :time_committment
      t.datetime :start_date
      t.datetime :finish_date

      t.timestamps null: false
    end
  end
end
