class AddAssemblyLineToSimulations < ActiveRecord::Migration
  def change
    add_reference :simulations, :assembly_line, index: true
  end
end
