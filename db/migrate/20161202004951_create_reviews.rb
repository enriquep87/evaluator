class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :class_comment_id
      t.integer :class_member_id
      t.string :rating

      t.timestamps

    end
  end
end
