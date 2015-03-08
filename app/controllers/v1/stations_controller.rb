class V1::StationsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    assembly_line = AssemblyLine.find params[:assembly_line_id]
    station = assembly_line.stations.create station_params[:station]
    
    render json: station 
  end

  def destroy
    station = Station.find params[:id]
    station.destroy

    render json: station
  end

  def station_params
    params.permit(:assembly_line_id, :station => [:name, :estimation_time])
  end

end
