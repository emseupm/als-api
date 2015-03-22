class Simulation < ActiveRecord::Base
  belongs_to :assembly_line
  has_many :station_results, dependent: :destroy 
  
  accepts_nested_attributes_for :station_results, allow_destroy: true
end
