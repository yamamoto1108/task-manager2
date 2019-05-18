class RenameRoworderColumnToCards < ActiveRecord::Migration[5.2]
  def change
    rename_column :cards, :row_order, :position
  end
end
