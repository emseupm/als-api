json.array! station_results do |station_result|
  json.id station_result.id
  json.elapsed_time station_result.elapsed_time
  json.delay_time station_result.delay_time
end
