class V1::InventoriesController < ApplicationController
	skip_before_filter :verify_authenticity_token

	def index
		@inventories = Inventory.all
	end

	def show
	    @inventory = Inventory.find params[:id]
	end

	def create
	    inventory = Inventory.new( 
	      :name => inventory_params[:name],
	      :group => inventory_params[:group],
	      :stock => inventory_params[:stock]
	    )
	    inventory.save

	    render json: inventory, status: :created
	end

	def destroy
	    inventory = Inventory.find params[:id]
	    inventory.destroy

	    render json: inventory
	end 

	def update
	    inventory = Inventory.find params[:id]

	    inventory.update_attributes(inventory_params)
	    render json: inventory, status: :updated
	end

	def add_stock
		inventory = Inventory.find params[:id]
		inventory.update_attributes(
			:stock => inventory[:stock]+1
		)
		render json: inventory, status: :updated
	end

	def remove_stock
		inventory = Inventory.find params[:id]
		if inventory[:stock] > 0
			inventory.update_attributes(
				:stock => inventory[:stock]-1
			)
			render json: inventory, status: :updated
		end
	end

	private
	  def inventory_params
	    params.permit(:name, :group, :stock)
	  end
end
