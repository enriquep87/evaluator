class CreateSessionComments < ActiveRecord::Migration
  def change
    create_table :session_comments do |t|
      t.integer :course_member_id
      t.string :summary
      t.string :body

      t.timestamps

    end
  end
end
