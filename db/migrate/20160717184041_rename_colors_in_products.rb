class RenameColorsInProducts < ActiveRecord::Migration
  def change
  	rename_column :products, :flower_color, :flower_colour
  end
end
