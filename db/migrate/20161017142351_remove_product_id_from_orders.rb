class RemoveProductIdFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :product_id
  end
end
