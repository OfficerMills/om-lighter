local Config = Config or {}
Config.Debug = true -- Enable or disable debug logs

local function DebugLog(message)
    if Config.Debug then
        print("[DEBUG] " .. message)
    end
end

local QBCore = exports['qb-core']:GetCoreObject()

if not QBCore then
    print("^1[ERROR] Failed to load QBCore. Ensure qb-core is properly configured.^7")
    return
end

DebugLog("QBCore loaded successfully.")

-- Prevent item spamming and ensure valid object
local recentUsers = {}

QBCore.Functions.CreateUseableItem("zippo_lighter", function(source, item)
    DebugLog("zippo_lighter item used by source: " .. tostring(source))

    -- Check if the player exists
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then
        print("^1[ERROR] Player not found for source: " .. tostring(source) .. "^7")
        return
    end
    DebugLog("Player found for source: " .. tostring(source))

    -- Prevent spam: Check if the player is in the recentUsers table
    if recentUsers[source] then
        DebugLog("Player attempted to use lighter but is in the recentUsers cooldown list.")
        TriggerClientEvent('QBCore:Notify', source, "You need to wait before using the lighter again!", "error")
        return
    end

    DebugLog("Player passed spam check and can use the lighter.")

    -- Trigger client event to start fire
    DebugLog("Triggering 'zippo:startFire' client event for source: " .. tostring(source))
    TriggerClientEvent('zippo:startFire', source)

    -- Add the player to the recentUsers table
    recentUsers[source] = true
    DebugLog("Added player to recentUsers cooldown list: " .. tostring(source))

    SetTimeout(5000, function()
        recentUsers[source] = nil -- Remove the player from the table after 5 seconds
        DebugLog("Removed player from recentUsers cooldown list: " .. tostring(source))
    end)
end)

--     ____  _________                   __  ____ ____    
--    / __ \/ __/ __(_)_______  _____   /  |/  (_) / /____ ™
--   / / / / /_/ /_/ / ___/ _ \/ ___/  / /|_/ / / / / ___/
--  / /_/ / __/ __/ / /__/  __/ /     / /  / / / / (__  ) 
--  \____/_/ /_/ /_/\___/\___/_/     /_/  /_/_/_/_/____/ 