class AddStationToLines < ActiveRecord::Migration
  def change
    add_reference :lines, :from_station, index: true
    add_reference :lines, :to_station, index: true
  end
end
