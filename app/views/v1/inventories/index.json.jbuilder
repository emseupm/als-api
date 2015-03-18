json.array! @inventories do |inventory|
  json.partial! "inventory", inventory: inventory
end
