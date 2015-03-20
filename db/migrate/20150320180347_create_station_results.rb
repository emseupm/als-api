class CreateStationResults < ActiveRecord::Migration
  def change
    create_table :station_results do |t|
      t.integer :elapsed_time
      t.integer :delay_time
      t.references :simulation, index: true
      t.timestamps
    end
  end
end
