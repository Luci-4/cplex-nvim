

-- see if the file exists
function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

-- get all lines from a file, returns an empty 
-- list/table if the file does not exist
function lines_from(file)
   local lines = "" 
  if not file_exists(file) then return {} end
  -- local lines = {}
  for line in io.lines(file) do 
      lines = lines .. line
    -- lines[#lines + 1] = line
  end
  return lines:gsub("%s+", "")
end

-- tests the functions above

function get_first_model_name()

    local file = '.oplproject'
    local lines = lines_from(file)
    for content in lines:gmatch("<ref(.-)>") do

          local name, type_

        -- extract name and type using Lua's pattern matching
        name = string.match(content, 'name="([^"]+)"')
        type_ = string.match(content, 'type="([^"]+)"')
        if type_ == "model" then
            return name
        end
        -- print the extracted values
        print("Name:", name)
        print("Type:", type_) 
    end
end


function run_configuration()
    filename = get_first_model_name()
    local extension = string.sub(filename, string.find(filename, "%.[^%.]+$"))
    local model_name = string.sub(filename, 1, string.len(filename) - string.len(extension))

    vim.cmd("ToggleTerm")
    vim.cmd("TermExec cmd=\"oplrun -p .\"")
    vim.cmd("TermExec cmd=\"cplex\"")
    vim.cmd(string.format("TermExec cmd=\"read %s.lp\"", model_name))
    vim.cmd("TermExec cmd=\"optimize\"")
    vim.cmd("TermExec cmd=\"display solution variables *\"")
end

local M = {}
M.run_configuration = run_configuration

return M
