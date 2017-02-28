class CreateReservedProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :reserved_products do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :quantity
      t.datetime :expire_time
    end
    add_index :reserved_products, :product_id
  end
end
