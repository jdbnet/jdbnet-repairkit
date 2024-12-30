local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem('repairkit', function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        TriggerClientEvent('repairkit:use', source)
    end
end)

RegisterNetEvent('repairkit:removeItem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        Player.Functions.RemoveItem('repairkit', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['repairkit'], 'remove')
    end
end)