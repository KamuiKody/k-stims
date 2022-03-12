--MADE BY DareToDoyle#3835--

ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('adrenaline', function(source)

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.removeInventoryItem('adrenaline', 1)
	TriggerClientEvent('D2D-Stims:adrenaline', source)
	
end)

ESX.RegisterUsableItem('meldonin', function(source)

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.removeInventoryItem('meldonin', 1)
	TriggerClientEvent('D2D-Stims:meldonin', source)
	
end)

ESX.RegisterUsableItem('anesthetic', function(source)

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.removeInventoryItem('anesthetic', 1)
	TriggerClientEvent('D2D-Stims:anesthetic', source)
	
end)

ESX.RegisterUsableItem('ketamine', function(source)

	local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.removeInventoryItem('ketamine', 1)
	TriggerClientEvent('D2D-Stims:ketamine', source)
	
end)

--MADE BY DareToDoyle#3835--
