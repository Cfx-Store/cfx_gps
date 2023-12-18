local function setRadarState(enabled)
  DisplayRadar(enabled)
end

local function refreshRadarState(item, count)
  if (count ~= nil and count <= 0) or (item ~= nil and item ~= Config.gpsItem) then
    setRadarState(false)
    return
  end

  local actualCount = count or ESX.SearchInventory({ Config.gpsItem }, 1)
  setRadarState(actualCount > 0)
end

RegisterNetEvent("esx:playerLoaded", function() refreshRadarState() end)
RegisterNetEvent("esx:addInventoryItem", refreshRadarState)
RegisterNetEvent("esx:removeInventoryItem", refreshRadarState)

RegisterNetEvent("cfx_gps:setRadarState", function(state)
  if state then
    setRadarState(true)
    return
  end

  refreshRadarState()
end)

Citizen.CreateThread(refreshRadarState)
