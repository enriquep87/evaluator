class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :session_comment_id
      t.integer :course_member_id
      t.string :rating

      t.timestamps

    end
  end
end
