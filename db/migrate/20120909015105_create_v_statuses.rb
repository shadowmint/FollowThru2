class CreateVStatuses < ActiveRecord::Migration
  def change
    create_table :v_statuses do |t|
      t.integer :v_user_data_id
      t.integer :v_project_id
      t.datetime :start_time
      t.datetime :end_time
      t.integer :status
      t.decimal :cost_total
      t.decimal :cost_progress
      t.decimal :cost_status
      t.integer :items_total
      t.integer :items_progress
      t.decimal :items_status

      t.timestamps
    end
  end
end
