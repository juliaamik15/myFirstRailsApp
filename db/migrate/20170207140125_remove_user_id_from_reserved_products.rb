class RemoveUserIdFromReservedProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :reserved_products, :user_id
  end
end
