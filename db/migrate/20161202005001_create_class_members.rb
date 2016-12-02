class CreateClassMembers < ActiveRecord::Migration
  def change
    create_table :class_members do |t|
      t.integer :student_id
      t.integer :class_id

      t.timestamps

    end
  end
end
