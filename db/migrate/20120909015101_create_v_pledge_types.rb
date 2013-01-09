class CreateVPledgeTypes < ActiveRecord::Migration
  def change
    create_table :v_pledge_types do |t|
      t.integer :v_user_data_id
      t.integer :v_project_id
      t.string :name
      t.string :desc
      t.decimal :cost
      t.integer :v_asset_id

      t.timestamps
    end
  end
end
