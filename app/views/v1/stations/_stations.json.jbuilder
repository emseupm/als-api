json.array! stations do |station|
  json.id station.id
  json.name station.name
  json.estimated_time station.estimated_time
end
