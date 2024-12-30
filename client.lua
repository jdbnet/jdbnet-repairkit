local function repairVehicle(vehicle)
    if DoesEntityExist(vehicle) then
        SetVehicleFixed(vehicle)
        SetVehicleDirtLevel(vehicle, 0.0)
        SetVehicleDeformationFixed(vehicle)
        SetVehicleUndriveable(vehicle, false)
        TriggerEvent('QBCore:Notify', 'Vehicle fully repaired!', 'success')
    else
        TriggerEvent('QBCore:Notify', 'No vehicle found nearby.', 'error')
    end
end

RegisterNetEvent('repairkit:use', function()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    -- If not in a vehicle, check the nearest vehicle
    if vehicle == 0 then
        local coords = GetEntityCoords(playerPed)
        vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
    end

    if vehicle and DoesEntityExist(vehicle) then
        FreezeEntityPosition(playerPed, true)

        lib.progressBar({
            duration = 5000, -- 5 seconds
            label = 'Repairing vehicle...',
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
            },
        })

        repairVehicle(vehicle)
        TriggerServerEvent('repairkit:removeItem')

        FreezeEntityPosition(playerPed, false)
    else
        TriggerEvent('QBCore:Notify', 'No vehicle nearby to repair.', 'error')
    end
end)