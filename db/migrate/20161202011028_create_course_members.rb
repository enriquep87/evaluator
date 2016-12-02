class CreateCourseMembers < ActiveRecord::Migration
  def change
    create_table :course_members do |t|
      t.integer :student_id
      t.integer :course_id

      t.timestamps

    end
  end
end
