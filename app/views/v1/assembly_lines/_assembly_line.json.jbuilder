json.id assembly_line.id
json.name assembly_line.name
json.icon assembly_line.icon
json.stations do
  json.partial! "v1/stations/stations", stations: assembly_line.stations
end
