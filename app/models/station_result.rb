class StationResult < ActiveRecord::Base
  belongs_to :station
  belongs_to :simulation
end
