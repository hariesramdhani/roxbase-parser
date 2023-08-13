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

local table= {
[1] = {},
[2] = {
  ["FavorNum"]= 2,
  ["Id"]= 2,
  ["LowSum"]= 36,
  ["TopSum"]= 48
},
[3] = {
  ["FavorNum"]= 3,
  ["Id"]= 3,
  ["LowSum"]= 48,
  ["TopSum"]= 60
},
[4] = {
  ["Id"]= 4,
  ["LowSum"]= 72,
  ["Quality"]= 2,
  ["TopSum"]= 90
},
[5] = {
  ["FavorNum"]= 2,
  ["Id"]= 5,
  ["LowSum"]= 90,
  ["Quality"]= 2,
  ["TopSum"]= 108
},
[6] = {
  ["FavorNum"]= 3,
  ["Id"]= 6,
  ["LowSum"]= 108,
  ["Quality"]= 2,
  ["TopSum"]= 126
},
[7] = {
  ["Id"]= 7,
  ["LowSum"]= 144,
  ["Quality"]= 3,
  ["TopSum"]= 168
},
[8] = {
  ["FavorNum"]= 2,
  ["Id"]= 8,
  ["LowSum"]= 168,
  ["Quality"]= 3,
  ["TopSum"]= 192
},
[9] = {
  ["FavorNum"]= 3,
  ["Id"]= 9,
  ["LowSum"]= 192,
  ["Quality"]= 3,
  ["TopSum"]= 216
}
}
local baseTable={
  ["FavorNum"]= 1,
  ["Id"]= 1,
  ["LowSum"]= 24,
  ["Quality"]= 1,
  ["TopSum"]= 36
}
for _,v in pairs(table) do
  setmetatable(v,{__index  = baseTable});
end


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
local file_path = "JSON//data_pet_PetInitEndowment.json"

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