class RenamePositionToCards < ActiveRecord::Migration[5.2]
  def change
    rename_column :cards, :position, :row_order
  end
end
