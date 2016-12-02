class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :last_name
      t.string :mba_class
      t.string :photo
      t.integer :user_id

      t.timestamps

    end
  end
end
