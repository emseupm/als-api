json.id simulation.id
json.elapsed_time simulation.elapsed_time
json.station_results do
  json.partial! "v1/station_results/station_results", station_results: simulation.station_results
end
