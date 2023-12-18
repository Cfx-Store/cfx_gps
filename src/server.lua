if Config.showRadarInVehicle then
  RegisterNetEvent("baseevents:enteredVehicle", function()
    TriggerClientEvent("cfx_gps:setRadarState", source, true)
  end)

  RegisterNetEvent("baseevents:leftVehicle", function()
    TriggerClientEvent("cfx_gps:setRadarState", source, false)
  end)
end
