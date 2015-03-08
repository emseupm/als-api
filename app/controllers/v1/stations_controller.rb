class V1::StationsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    station = Station.create station_params
    render json: station
  end

  def destroy
    station = Station.find params[:id]
    station.destroy

    render json: station
  end


  def station_params
    params.permit(:name, :estimated_time, "assembly_line_id")
  end

end
