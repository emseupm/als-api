class V1::AssemblyLineController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def index
    @assembly_lines = AssemblyLine.all
  end

  def show
    @assembly_line = AssemblyLine.find params[:id]
  end

  def create
    assembly_line = AssemblyLine.new name:params[:name]

    params[:stations].each do |station|
      assembly_line.stations.new(
          name: station[:name], 
          estimated_time: station[:estimated_time]
      )
    end
    assembly_line.save

    render json: assembly_line
  end
end
