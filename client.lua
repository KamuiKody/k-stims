--MADE BY DareToDoyle#3835-- originally
-- converted by kamui_kody
local QBCore = exports['qb-core']:GetCoreObject()

local ketEffects = false
local meldoninEffects = false
local sj6Effects = false

-- Effect Functions (You can play around with this if you know what you're doing)
local function sj6Loop()
    CreateThread(function()
		local player = PlayerId()
        while true do
            Wait(50)
            if sj6Effects then
                RestorePlayerStamina(player, 1.0)
            elseif not sj6Effects then
                break
            end
        end
    end)
end

local function melLoop()
    CreateThread(function()
		local player = PlayerId()
        while true do
            Wait(50)
            if meldoninEffects then
                SetPedMoveRateOverride(player,7.0)
                SetRunSprintMultiplierForPlayer(player,1.30)
                RestorePlayerStamina(player, 1.0)
            elseif not meldoninEffects then
                SetPedMoveRateOverride(player,1.0)
                SetRunSprintMultiplierForPlayer(player,1.0)
                break
            end
        end
    end)
end

local function ketLoop()
    CreateThread(function()
        local ped = PlayerPedId()
        while true do
            Wait(50)
            if ketEffects then
                RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK")
                SetPedMovementClipset(ped, "MOVE_M@DRUNK@VERYDRUNK", 1.0)
            elseif not ketEffects then
                ResetPedMovementClipset(ped)
                ResetPedWeaponMovementClipset(ped)
                ResetPedStrafeClipset(ped)
                break
            end
        end
    end)
end

local function discoLoop()
    CreateThread(function()
        while true do
            Wait(0)
            if disco then
                AnimpostfxPlay("PPOrange", 0, false)
                Wait(600)
                AnimpostfxStopAll()
                AnimpostfxPlay("PPGreen", 0, false)
                Wait(600)
                AnimpostfxStopAll()
                AnimpostfxPlay("PPPink", 0, false)
                Wait(600)
                AnimpostfxStopAll()
                AnimpostfxPlay("PPPurple", 0, false)
                Wait(600)
                AnimpostfxStopAll()
            elseif not disco then
                break
            end
        end
    end)
end

local function Adrenaline()
    QBCore.Functions.Notify('Adrenaline Stimulant has been taken!')
    AnimpostfxPlay("SuccessFranklin", 0, false)
    ShakeGameplayCam("DRUNK_SHAKE", 0.3)
    AnimpostfxStopAll()
    SetEntityHealth(player, GetEntityMaxHealth(player))
end

local function sj6()
    QBCore.Functions.Notify('SJ-6 Stimulant has been taken!')
    AnimpostfxPlay("SuccessFranklin", 0, false)
    sj6Effects = true
    sj6Loop()
    ShakeGameplayCam("DRUNK_SHAKE", 0.3)
    AnimpostfxStopAll()
end

local function Meldonin()
    QBCore.Functions.Notify('Meldonin Stimulant has been taken!')
    AnimpostfxPlay("SuccessFranklin", 0, false)
    meldoninEffects = true
    melLoop()
    ShakeGameplayCam("DRUNK_SHAKE", 0.3)
    AnimpostfxStopAll()
end

local function Anesthetic()
    QBCore.Functions.Notify('Anesthetic Stimulant has been taken!')
    AnimpostfxPlay("SuccessFranklin", 0, false)
    ShakeGameplayCam("DRUNK_SHAKE", 0.3)
    AnimpostfxStopAll()
    SetPedArmour(player, 100)
end

local function Ketamine()
    SendNUIMessage({sound = "ketamine", volume = 0.5})
    Wait(500)    
    QBCore.Functions.Notify('Ketamine has been taken!')
    AnimpostfxPlay("SuccessFranklin", 0, false)
    ShakeGameplayCam("DRUNK_SHAKE", 0.3)
    ketEffects = true
    disco = true
    ketLoop()
    discoLoop()
end

-------------

local function munchies()
    for i = 1,Config.Needs['hunger'] do
        Wait(Config.Needs['refresh'])
        TriggerServerEvent("consumables:server:addHunger", QBCore.Functions.GetPlayerData().metadata["hunger"] - Config.Needs['reduction'].hunger)
    end
end

local function cottonMouth()
    for i = 1,Config.Needs['thirst'] do
        Wait(Config.Needs['refresh'])
        TriggerServerEvent("consumables:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] - Config.Needs['reduction'].thirst)
    end
end

----------- Events

RegisterNetEvent('QBCore:Client:UpdateObject', function()
    QBCore = exports['qb-core']:GetCoreObject()
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore = exports['qb-core']:GetCoreObject()
end)

RegisterNetEvent('D2D-Stims:stimit', function(item)
    local player = PlayerPedId()
    QBCore.Functions.RequestAnimDict('mp_arresting')
    TaskPlayAnim(player, 'mp_arresting', 'a_uncuff', 8.0, 2.0, 1200, 48, 10, 0, 0, 0)
    SendNUIMessage({sound = "stimshot", volume = 0.2})
    local sleep = 2500
    if item =='ketamine' then sleep = 1500 end
    Wait(sleep)
    if item == 'adrenaline' then
        Adrenaline()
    elseif item == 'anesthetic' then
        Anesthetic()
    elseif item == 'meldonin' then
        Meldonin()
    elseif item == 'ketamine' then
        Ketamine()
	elseif item == 'sj6' then
		sj6()
		Wait(95000)
    end
    Wait(25000) -- HOW LONG THE EFFECT LASTS (25 seconds)
    meldoninEffects = false
	sj6Effects = false
    disco = false
    ketEffects = false
    SendNUIMessage({sound = "heartbeat", volume = 0.6}) 
    QBCore.Functions.Notify('The effects of the Adrenaline Stimulant have now gone.')
    ShakeGameplayCam("DRUNK_SHAKE", 0.0)
    AnimpostfxStopAll()
    if Config.Needs['thirst'] then
        cottonMouth()
    end
    if Config.Needs['hunger'] then
        munchies()
    end
end)