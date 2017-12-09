class CreateSenders < ActiveRecord::Migration[5.1]
  def change
    create_table :senders do |t|
      t.string :name
    end
  end
end
