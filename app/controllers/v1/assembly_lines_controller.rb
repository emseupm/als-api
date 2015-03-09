class V1::AssemblyLinesController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def index
    @assembly_lines = AssemblyLine.all
  end

  def show
    @assembly_line = AssemblyLine.find params[:id]
  end

  def create
    assembly_line = AssemblyLine.new( 
      assembly_line_params.except(:stations),
    )
    assembly_line.stations_attributes = assembly_line_params[:stations]
    assembly_line.save

    render json: assembly_line, status: :created
  end

  def destroy
    assembly_line = AssemblyLine.find params[:id]
    assembly_line.destroy

    render json: assembly_line
  end 

  def assembly_line_params
    params.permit(:id, :name, :stations => [:name, :estimated_time])
  end

end
