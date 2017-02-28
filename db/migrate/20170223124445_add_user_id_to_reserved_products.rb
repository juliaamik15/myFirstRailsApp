class AddUserIdToReservedProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :reserved_products, :user_id, :integer
  end
end
