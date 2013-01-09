class CreateVGoals < ActiveRecord::Migration
  def change
    create_table :v_goals do |t|
      t.integer :v_user_data_id
      t.integer :v_project_id
      t.decimal :cost
      t.integer :v_pledge_type_id
      t.integer :count

      t.timestamps
    end
  end
end
