local function setRadarState(enabled)
  DisplayRadar(enabled)
end

local function hasGpsItem(inventory)
  for _, item in pairs(inventory) do
    if item.name == Config.gpsItem then
      return true
    end
  end
  return false
end

local function updateRadarState(inv)
  local xPlayer = ESX.GetPlayerData()
  local inventory = inv or xPlayer.inventory
  local hasGps = hasGpsItem(inventory)
  setRadarState(hasGps)
end

local function onInventoryChange(item, count)
  print(item, count)
  if item ~= Config.gpsItem then
    return
  end

  setRadarState(count > 0)
end

RegisterNetEvent("esx:addInventoryItem", onInventoryChange)
RegisterNetEvent("esx:removeInventoryItem", onInventoryChange)

RegisterNetEvent("esx:playerLoaded", function(xPlayer)
  local inventory = xPlayer.inventory
  updateRadarState(inventory)
end)

RegisterNetEvent("cfx_gps:setRadarState", function(state)
  if state then
    setRadarState(true)
    return
  end
  updateRadarState()
end)

Citizen.CreateThread(function()
  while not ESX.IsPlayerLoaded() do
    Citizen.Wait(100)
  end
  updateRadarState()
end)
