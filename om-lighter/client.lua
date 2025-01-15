local function DebugLog(message)
    if Config.Debug then
        print("^2[DEBUG]^7 " .. message)
    end
end

local function PlayAnimation(ped, animDict, animName, duration)
    DebugLog("Requesting animation dictionary: " .. animDict)
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        DebugLog("Waiting for animation dictionary to load...")
        Wait(100)
    end

    TaskPlayAnim(ped, animDict, animName, 8.0, -8.0, duration, 1, 0, false, false, false)
    DebugLog("Animation played: " .. animName)

    Wait(duration)
    ClearPedTasksImmediately(ped)
    DebugLog("Animation completed.")
end

local function SpreadFire(initialCoords)
    local currentRadius = Config.FireSpread.InitialRadius
    local maxRadius = Config.FireSpread.MaxRadius
    local childFireDistance = Config.FireSpread.ChildFireDistance

    DebugLog("Starting fire spread...")

    while currentRadius < maxRadius do
        currentRadius = currentRadius + childFireDistance

        for _ = 1, Config.FireSpread.MaxFiresPerStep do
            local randomAngle = math.rad(math.random(0, 360))
            local fireX = initialCoords.x + math.cos(randomAngle) * currentRadius
            local fireY = initialCoords.y + math.sin(randomAngle) * currentRadius
            local fireZ = initialCoords.z

            local foundGround, groundZ = GetGroundZFor_3dCoord(fireX, fireY, fireZ, false)
            if foundGround then
                fireZ = groundZ
            else
                DebugLog("Failed to find ground level.")
            end

            StartScriptFire(fireX, fireY, fireZ, math.random(Config.FireSpread.MinChildren, Config.FireSpread.MaxChildren), Config.IsGasFire)
            DebugLog(string.format("Child fire created at: %.2f, %.2f, %.2f", fireX, fireY, fireZ))
        end

        Wait(Config.FireSpread.DelayBetweenGrowth)
    end

    DebugLog("Fire spreading complete.")
end

RegisterNetEvent('zippo:startFire')
AddEventHandler('zippo:startFire', function()
    local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(ped)
    local pedHeading = GetEntityHeading(ped)

    local adjustedHeading = (pedHeading + 90) % 360
    local forwardX = pedCoords.x + math.cos(math.rad(adjustedHeading)) * Config.Offset.X
    local forwardY = pedCoords.y + math.sin(math.rad(adjustedHeading)) * Config.Offset.X
    local forwardZ = pedCoords.z

    local foundGround, groundZ = GetGroundZFor_3dCoord(forwardX, forwardY, pedCoords.z + 1.0, false)
    if foundGround then
        forwardZ = groundZ
    end

    DebugLog(string.format("Fire position: %.2f, %.2f, %.2f", forwardX, forwardY, forwardZ))

    PlayAnimation(ped, Config.Animation.Dict, Config.Animation.Name, Config.Animation.Duration)
    StartScriptFire(forwardX, forwardY, forwardZ, math.random(Config.FireSpread.MinChildren, Config.FireSpread.MaxChildren), Config.IsGasFire)

    SpreadFire(vector3(forwardX, forwardY, forwardZ))
end)


--     ____  _________                   __  ____ ____    
--    / __ \/ __/ __(_)_______  _____   /  |/  (_) / /____ ™
--   / / / / /_/ /_/ / ___/ _ \/ ___/  / /|_/ / / / / ___/
--  / /_/ / __/ __/ / /__/  __/ /     / /  / / / / (__  ) 
--  \____/_/ /_/ /_/\___/\___/_/     /_/  /_/_/_/_/____/ 