class AddCreationDateToProducts < ActiveRecord::Migration
  def change
    add_column :products, :creation_date, :date
  end
end
