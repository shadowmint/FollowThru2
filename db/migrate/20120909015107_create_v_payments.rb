class CreateVPayments < ActiveRecord::Migration
  def change
    create_table :v_payments do |t|
      t.integer :v_user_data_id
      t.integer :v_pledge_id
      t.integer :v_project_id
      t.decimal :amount
      t.datetime :date

      t.timestamps
    end
  end
end
