class CreateClassComments < ActiveRecord::Migration
  def change
    create_table :class_comments do |t|
      t.integer :class_member_id
      t.string :summary
      t.string :body

      t.timestamps

    end
  end
end
