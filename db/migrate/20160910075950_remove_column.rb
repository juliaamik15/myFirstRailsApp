class RemoveColumn < ActiveRecord::Migration
  def change
  	remove_column :products, :creation_date
  end
end
