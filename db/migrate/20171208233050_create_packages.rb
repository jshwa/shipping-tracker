class CreatePackages < ActiveRecord::Migration[5.1]
  def change
    create_table :packages do |t|
      t.string :name
      t.string :shipping_co
      t.date :delivery_date
      t.string :status
      t.integer :tracking_no
      t.integer :user_id
      t.integer :sender_id
    end
  end
end
