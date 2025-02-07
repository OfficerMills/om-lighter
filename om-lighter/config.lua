--     ____  _________                   __  ____ ____    
--    / __ \/ __/ __(_)_______  _____   /  |/  (_) / /____ ™
--   / / / / /_/ /_/ / ___/ _ \/ ___/  / /|_/ / / / / ___/
--  / /_/ / __/ __/ / /__/  __/ /     / /  / / / / (__  ) 
--  \____/_/ /_/ /_/\___/\___/_/     /_/  /_/_/_/_/____/ 

Config = {}

-- Debug settings
Config.Debug = false

-- Fire spread configuration
Config.FireSpread = {
    MinChildren = 1, -- Minimum number of child fires per instance
    MaxChildren = 3, -- Maximum number of child fires per instance
    InitialRadius = 0.0, -- Starting radius for the first fire
    MaxRadius = 35.0, -- Maximum radius of fire growth
    ChildFireDistance = .3, -- Distance between child fires
    DelayBetweenGrowth = 4550, -- Delay in milliseconds between growth steps
    MaxFiresPerStep = 2 -- Maximum fires spawned per step to prevent overload
}

-- Gas fire settings
Config.IsGasFire = false -- Whether the fire is powered by gas (LEAVE AS FALSE)

-- Animation settings
Config.Animation = {
    Dict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", -- Animation dictionary
    Name = "machinic_loop_mechandplayer", -- Animation name
    Duration = 5000 -- Animation duration in milliseconds
}

-- Fire placement offset
Config.Offset = {
    X = 1.1, -- Forward offset to place fire directly in front of the ped
    Y = 0.0, -- No sideways offset
    Z = 0.0 -- Vertical offset (height adjustment)
}
