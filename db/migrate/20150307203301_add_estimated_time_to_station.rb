class AddEstimatedTimeToStation < ActiveRecord::Migration
  def change
    add_column :stations, :estimated_time, :integer
  end
end
