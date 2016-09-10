class AddAvailabilityToProducts < ActiveRecord::Migration
  def change
    add_column :products, :availability, :boolean
  end
end
