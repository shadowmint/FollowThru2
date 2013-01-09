class CreateVPledges < ActiveRecord::Migration
  def change
    create_table :v_pledges do |t|
      t.integer :v_user_data_id
      t.integer :v_project_id
      t.integer :v_pledge_type_id
      t.decimal :amount
      t.integer :reminder
      t.boolean :cancelled

      t.timestamps
    end
  end
end
