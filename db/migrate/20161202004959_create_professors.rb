class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      t.string :name
      t.integer :user_id
      t.string :last_name

      t.timestamps

    end
  end
end
