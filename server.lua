--MADE BY DareToDoyle#3835-- originally
-- converted by kamui_kody
local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Server:UpdateObject', function()
    if source ~= '' then return false end
    QBCore = exports['qb-core']:GetCoreObject()
end)

AddEventHandler('onResourceStart', function(resource)
    if GetCurrentResourceName() ~= resource then return end
    for k,v in pairs(Config.Items) do
        exports['qb-core']:AddItem(k,v)
    end
    TriggerClientEvent('QBCore:Client:UpdateObject', -1)
    TriggerEvent('QBCore:Sever:UpdateObject')
    for k,v in pairs(Config.Items) do
        QBCore.Functions.CreateUseableItem(k, function(source, item)
            local src = source
            local Player = QBCore.Functions.GetPlayer(src)
            if Player.Functions.RemoveItem(item.name, 1) then
                TriggerClientEvent('D2D-Stims:stimit', src, item.name)
            end
        end)
    end
end)