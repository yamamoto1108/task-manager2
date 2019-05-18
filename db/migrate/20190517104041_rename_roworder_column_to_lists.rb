class RenameRoworderColumnToLists < ActiveRecord::Migration[5.2]
  def change
    rename_column :lists, :row_order, :position
  end
end
