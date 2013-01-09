class CreateVAssets < ActiveRecord::Migration
  def change
    create_table :v_assets do |t|
      t.integer :v_user_data_id
      t.integer :v_project_id
      t.string :id
      t.string :path

      t.timestamps
    end
  end
end
