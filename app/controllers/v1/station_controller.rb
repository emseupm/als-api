class StationController < ApplicationController

  def create
    Station.create station_params
  end


  def station_params
    params.permit("name", "estimated_time", "assembly_line_id")
  end

end
