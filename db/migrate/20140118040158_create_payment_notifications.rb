class CreatePaymentNotifications < ActiveRecord::Migration
  def change
    create_table :payment_notifications do |t|
      t.integer :post_id
      t.text :params
      t.string :status
      t.string :transaction_id
     

      t.timestamps
    end
  end
end
