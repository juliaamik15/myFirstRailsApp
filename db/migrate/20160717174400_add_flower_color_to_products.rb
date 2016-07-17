class AddFlowerColorToProducts < ActiveRecord::Migration
  def change
    add_column :products, :flower_color, :string
  end
end
