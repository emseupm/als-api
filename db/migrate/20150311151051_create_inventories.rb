class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :name
      t.string :group, :default =>""
      t.integer :stock, :default => 0

      t.timestamps
    end
  end
end
