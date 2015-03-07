class AddAssemblyLineRefToStations < ActiveRecord::Migration
  def change
    add_reference :stations, :assembly_line, index: true
  end
end
