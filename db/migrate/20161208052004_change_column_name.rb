class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :class_members, :class_id, :course_id
  end
end
