class CreateVPaymentTypes < ActiveRecord::Migration
  def change
    create_table :v_payment_types do |t|
      t.integer :v_user_data_id
      t.string :name

      t.timestamps
    end
  end
end
