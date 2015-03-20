class CreateSimulations < ActiveRecord::Migration
  def change
    create_table :simulations do |t|
      t.integer :elapsed_time
      t.timestamps
    end
  end
end
