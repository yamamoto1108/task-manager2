class RenamePositionToLists < ActiveRecord::Migration[5.2]
  def change
    rename_column :lists, :position, :row_order
  end
end
