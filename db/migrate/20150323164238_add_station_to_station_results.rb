class AddStationToStationResults < ActiveRecord::Migration
  def change
    add_reference :station_results, :station, index: true
  end
end
