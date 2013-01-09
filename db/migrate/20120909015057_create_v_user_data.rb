class CreateVUserData < ActiveRecord::Migration
  def change
    create_table :v_user_data do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
