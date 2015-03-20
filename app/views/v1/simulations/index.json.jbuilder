json.array! @simulations do |simulation|
  json.partial! "simulation", simulation: simulation
end
