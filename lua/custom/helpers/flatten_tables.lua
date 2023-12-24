local flatten_tables = function(tables)
  local sources = {}

  for _, outer in pairs(tables) do
    for _, inner in pairs(outer) do
      table.insert(sources, inner)
    end
  end

  return sources
end

return flatten_tables
