-- Define the JSON serialization function
local function to_json(value)
  if type(value) == "table" then
      local json = "{"
      local first = true
      for k, v in pairs(value) do
          if not first then
              json = json .. ","
          else
              first = false
          end
          json = json .. '"' .. k .. '":' .. to_json(v)
      end
      json = json .. "}"
      return json
  elseif type(value) == "number" or type(value) == "boolean" then
      return tostring(value)
  elseif type(value) == "string" then
      return '"' .. value .. '"'
  else
      return "null"
  end
end

{{TABLE}}

-- Combine the attributes
local json_table = {}
for _, v in pairs(table) do
  local combined_table = {}
  for k, base_value in pairs(baseTable) do
      if v[k] == nil then
          combined_table[k] = base_value
      else
          combined_table[k] = v[k]
      end
  end
  json_table[_] = combined_table
end

local json_string = to_json(json_table)

-- Specify the file path where you want to save the JSON
local file_path = "JSON//{{TITLE}}.json"

-- Open the file for writing
local file = io.open(file_path, "w")
if file then
    -- Write the JSON string to the file
    file:write(json_string)
    -- Close the file
    file:close()
    print("JSON data saved to " .. file_path)
else
    print("Error opening file for writing")
end