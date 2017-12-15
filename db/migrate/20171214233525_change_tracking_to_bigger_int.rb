class ChangeTrackingToBiggerInt < ActiveRecord::Migration[5.1]
  def change
      change_column :packages, :tracking_no, :integer, limit:40
  end
end
