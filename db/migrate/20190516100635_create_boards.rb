class CreateBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :boards do |t|
      t.string :name, null: false
      t.text :about
      t.date :deadline

      t.timestamps
    end
  end
end
