json.array! @assembly_lines do |assembly_line|
  json.partial! "assembly_line", assembly_line: assembly_line
end
