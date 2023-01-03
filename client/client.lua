-- MADE BY DareToDoyle#3835-- originally
-- converted by kamui_kody
local QBCore = exports['qb-core']:GetCoreObject()

local ketEffects = false
local meldoninEffects = false
local sj6Effects = false

-- Effect Functions (You can play around with this if you know what you're doing)
local function sj6Loop()
    CreateThread(function()
        local player = PlayerPedId()
        while true do
            Wait(50)
            if sj6Effects then
                RestorePlayerStamina(player, 1.0)
                SetRunSprintMultiplierForPlayer(player, 1.30)
            elseif not sj6Effects then
                break
            end
        end
    end)
end

local function melLoop()
    CreateThread(function()
        local player = PlayerPedId()
        while true do
            Wait(50)
            if meldoninEffects then
                SetPedMoveRateOverride(player, 7.0)
                SetRunSprintMultiplierForPlayer(player, 1.30)
                RestorePlayerStamina(player, 1.0)
            elseif not meldoninEffects then
                SetPedMoveRateOverride(player, 1.0)
                SetRunSprintMultiplierForPlayer(player, 1.0)
                break
            end
        end
    end)
end

local function ketLoop()
    CreateThread(function()
        local player = PlayerPedId()
        while true do
            Wait(50)
            if ketEffects then
                RequestAnimSet("MOVE_M@DRUNK@VERYDRUNK")
                SetPedMovementClipset(player, "MOVE_M@DRUNK@VERYDRUNK", 1.0)
            elseif not ketEffects then
                ResetPedMovementClipset(player)
                ResetPedWeaponMovementClipset(player)
                ResetPedStrafeClipset(player)
                break
            end
        end
    end)
end

local function Adrenaline()
    local player = PlayerPedId()
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
    local player = PlayerPedId()
    QBCore.Functions.Notify('Anesthetic Stimulant has been taken!')
    AnimpostfxPlay("SuccessFranklin", 0, false)
    ShakeGameplayCam("DRUNK_SHAKE", 0.3)
    AnimpostfxStopAll()
    SetPedArmour(player, 100)
end

local function Ketamine()
    Wait(500)
    QBCore.Functions.Notify('Ketamine has been taken!')
    AnimpostfxPlay("SuccessFranklin", 0, false)
    ShakeGameplayCam("DRUNK_SHAKE", 0.3)
    ketEffects = true
    ketLoop()
end

local function Morphine()
    local player = PlayerPedId()
    Wait(500) 
    QBCore.Functions.Notify('Morphine has been taken!')
    AnimpostfxPlay("SuccessFranklin", 0, false)
    ShakeGameplayCam("DRUNK_SHAKE", 0.3)
    GetEntityMaxHealth(player)
    SetEntityHealth(player, 200)
end

local function etgchange()
    local player = PlayerPedId()
    Wait(500)
    QBCore.Functions.Notify('etg-change has been taken!')
    AnimpostfxPlay("SuccessFranklin", 0, false)
    ShakeGameplayCam("DRUNK_SHAKE", 0.3)
    SetPedArmour(player, 100)
    SetEntityHealth(player, 200)
end

------------- Reductions

local function munchies()
    for i = 1, Config.Needs['hunger'] do
        Wait(60)
        TriggerServerEvent("consumables:server:addHunger",
            QBCore.Functions.GetPlayerData().metadata["hunger"] - Config.Needs['reduction'].hunger)
    end
end

local function cottonMouth()
    for i = 1, Config.Needs['thirst'] do
        Wait(60)
        TriggerServerEvent("consumables:server:addThirst",
            QBCore.Functions.GetPlayerData().metadata["thirst"] - Config.Needs['reduction'].thirst)
    end
end

----------- Events

RegisterNetEvent('D2D-Stims:stimit', function(item)
    local player = PlayerPedId()
    QBCore.Functions.RequestAnimDict('mp_arresting')
    TaskPlayAnim(player, 'mp_arresting', 'a_uncuff', 8.0, 2.0, 1200, 48, 10, 0, 0, 0)
    SendNUIMessage({
        sound = "stimshot",
        volume = 0.2
    })
    local sleep = 2500
    if item == 'ketamine' then
        sleep = 1500
    end
    Wait(sleep)
    if item == 'adrenaline' then
        Adrenaline()
    elseif item == 'anesthetic' then
        Anesthetic()
    elseif item == 'meldonin' then
        Meldonin()
    elseif item == 'ketamine' then
        Ketamine()
    elseif item == 'morphine' then
        Morphine()
    elseif item == 'etg-change' then
        etgchange()
    elseif item == 'sj6' then
        sj6()
        Wait(95000)
    end
    Wait(5000) -- HOW LONG THE EFFECT LASTS (25 seconds)
    meldoninEffects = false
    sj6Effects = false
    ketEffects = false
    SendNUIMessage({
        sound = "heartbeat",
        volume = 0.6
    })
    QBCore.Functions.Notify('The effects of the Stimulant are now gone.')
    ShakeGameplayCam("DRUNK_SHAKE", 0.0)
    AnimpostfxStopAll()
    if Config.Needs['thirst'] then
        cottonMouth()
    end
    if Config.Needs['hunger'] then
        munchies()
    end
end)
