json.id assembly_line.id
json.name assembly_line.name
json.stations do
  json.partial! "v1/station/stations", stations: assembly_line.stations
end
