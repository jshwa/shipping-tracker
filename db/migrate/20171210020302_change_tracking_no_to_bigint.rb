class ChangeTrackingNoToBigint < ActiveRecord::Migration[5.1]
  def change
    change_column :packages, :tracking_no, :integer, limit:8
  end
end
