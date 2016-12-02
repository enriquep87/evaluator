class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :professor_id
      t.string :name
      t.string :quarter

      t.timestamps

    end
  end
end
