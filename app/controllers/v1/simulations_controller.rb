class V1::SimulationsController < ApplicationController
  skip_before_filter :verify_authenticity_token


  def index
    @simulations = Simulation.all  
  end

  def show
    @simulation = Simulation.find params[:id]
  end

  def create
    #binding.pry
    simulation = Simulation.new(
      simulation_params.except(:station_results)
    )
    
    simulation.station_results_attributes = simulation_params[:station_results]

    simulation.save
    render json: simulation, status: :created
  end 


  def simulation_params
    params.permit(
      :assembly_line_id,
      :elapsed_time,
      station_results: [
        :station_id, :elapsed_time, :delay_time
      ]
    )
  end

end
