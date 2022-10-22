--MADE BY DareToDoyle#3835-- originally
-- converted by kamui_kody
local QBCore = exports['qb-core']:GetCoreObject()

local items = {
    ['ketamine'] 				 = {['name'] = 'ketamine', 			 	['label'] = 'Ketamine Shot', 	['weight'] = 100, 		['type'] = 'item', 		['image'] = 'ketamine.png', 		['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,  ['combinable'] = nil,   ['description'] = ''},
	['anesthetic'] 				 = {['name'] = 'anesthetic', 			['label'] = 'Anesthetic Shot', 	['weight'] = 100, 		['type'] = 'item', 		['image'] = 'anesthetic.png', 		['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,  ['combinable'] = nil,   ['description'] = ''},
	['meldonin'] 				 = {['name'] = 'meldonin', 			  	['label'] = 'Meldonin Shot', 	['weight'] = 100, 		['type'] = 'item', 		['image'] = 'meldonin.png', 		['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,	 ['combinable'] = nil,   ['description'] = ''},
	['adrenaline'] 				 = {['name'] = 'adrenaline', 			['label'] = 'Adrenaline Shot', 	['weight'] = 100, 		['type'] = 'item', 		['image'] = 'adrenaline.png', 		['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,	 ['combinable'] = nil,   ['description'] = ''},
}
RegisterNetEvent('QBCore:Server:UpdateObject', function()
	if source ~= '' then return false end
	QBCore = exports['qb-core']:GetCoreObject()
end)

for k,v in pairs(Items) do
    QBCore.Functions.CreateUseableItem(k, function(source, item)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        if Player.Functions.RemoveItem(item.name, 1) then
            TriggerClientEvent('D2D-Stims:stimit', src, item.name)
        end
    end)
end

AddEventHandler('onResourceStart', function(resource)
    if GetCurrentResourceName() ~= resource then return end
    for k,v in pairs(items) do		
        exports['qb-core']:AddItem(k,v)
    end
    TriggerClientEvent('QBCore:Client:UpdateObject', -1)
    TriggerEvent('QBCore:Sever:UpdateObject')
end)