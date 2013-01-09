class CreateVProjects < ActiveRecord::Migration
  def change
    create_table :v_projects do |t|
      t.integer :v_user_data_id
      t.string :name
      t.string :desc
      t.integer :v_asset_id

      t.timestamps
    end
  end
end
