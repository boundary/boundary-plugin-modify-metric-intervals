local framework = require('framework')
local MeterDataSource = framework.MeterDataSource
local PollerCollection = framework.PollerCollection
local DataSourcePoller = framework.DataSourcePoller
local Plugin = framework.Plugin
local io = require('io')
local table = require('table')
local string = require('string')
local pack = framework.util.pack

local concat = framework.string.concat
local clone = framework.table.clone

local params = framework.params 
params.name = 'Boundary Metric Interval Modification Plugin'
params.version = '1.0'
params.tags = "jsonrpc,meter"
params.pollInterval = 1000*60*60*24*7

local function createPollers (params)
  local pollers = PollerCollection:new()
  for _, item in ipairs(params.items) do

    local meter_data_source = MeterDataSource:new()

    function meter_data_source:onFetch(socket)
      socket:write('{"jsonrpc":"2.0","id":1,"method":"set_probe_interval","params":{"probe": "' .. item.probe .. '", "ms":' .. item.ms .. '}}')
      print("_bevent:" .. params.name .. " Probe " .. item.probe .. " Interval set to " .. item.ms .. "ms: version " .. params.version .. concat("|t:info|tags:lua,plugin", params.tags, ','))
    end

    local poll_interval = params.pollInterval
    local poller = DataSourcePoller:new(poll_interval, meter_data_source)
    pollers:add(poller)
  end

  return pollers
end

local pollers = createPollers(params)
local meterPlugin = Plugin:new(params, pollers)

function meterPlugin:onParseValues(data)
  local result = {}

  return result
end

meterPlugin:run()
