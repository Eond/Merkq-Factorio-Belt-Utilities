require("utils.name-gen")
require("utils.entity-tracker")
require("utils.compound-tracker")
require("utils.surface-tools")

require("prototypes.control-helpers")
require("prototypes.itemless.control")
require("prototypes.lane_swapper.control")
require("prototypes.lane_balancer.control")

--An automatic event manager I quickly wrote
--Scans global name space for functions with
--a matching prefix and gets event functions

local event_funcs = {
    build         = {},
    robo_build    = {},
    script_build  = {},
    script_revive = {},
    mined         = {},
    robo_mined    = {},
    rotated       = {},
    destroyed     = {},
    died          = {},
    damaged       = {},
}

local event_prefixes = {
    { "on_built_entity_",          "build" },
    { "on_robot_built_entity_",    "robo_build" },
    { "on_script_raised_built_",   "script_build" },
    { "on_script_raised_revive_",  "script_revive" },
    { "on_player_mined_entity_",   "mined" },
    { "on_robot_mined_entity_",    "robo_mined" },
    { "on_player_rotated_entity_", "rotated" },
    { "on_entity_destroyed_",      "destroyed" },
    { "on_entity_died_",           "died" },
    { "on_entity_damaged_",        "damaged" },
    { "on_marked_for_upgrade_",    "upgrade" },
}

local function save_event_functions()
    for i, entry in pairs(_G) do
        -- Wish lua had continue...
        if type(entry) == "function" and string.sub(i, 1, 2) == "__" then
            for _, pre in pairs(event_prefixes) do
                local prefix = pre[1]
                if string.sub(i, 3, #prefix + 2) == prefix then
                    --print("Registering: " .. i)
                    table.insert(event_funcs[pre[2]], entry)
                    break
                end
            end
        end
    end
end

local function call_all_events(name, event)
    if event_funcs[name] == nil then
        return
    end
    for i, entry in pairs(event_funcs[name]) do
        entry(event)
    end
end

local function call_on_loads()
    local prefix = "__on_load_"
    for i, entry in pairs(_G) do
        if type(entry) == "function" and string.sub(i, 1, #prefix) == prefix then
            entry()
        end
    end
end

script.on_configuration_changed(function()
    local prefix = "__on_reconfig_"
    --print("Config Change Handler")
    for i, entry in pairs(_G) do
        if type(entry) == "function" and string.sub(i, 1, #prefix) == prefix then
            entry()
        end
    end
end)

local loaded = false
local function load_init()
    if loaded then
        return
    end
    call_on_loads()
    save_event_functions()
    loaded = true
end
script.on_load(load_init)
script.on_init(load_init)

script.on_event(defines.events.on_built_entity, function(event)
    --print("Script Built Handler")
    call_all_events("build", event)
end)


script.on_event(defines.events.on_robot_built_entity, function(event)
    call_all_events("robo_build", event)
end)

script.on_event(defines.events.script_raised_built, function(event)
    --print("Script Built Handler")
    call_all_events("script_build", event)
end)

script.on_event(defines.events.script_raised_revive, function(event)
    call_all_events("script_revive", event)
end)

script.on_event(defines.events.on_player_mined_entity, function(event)
    --print("Entity Mined Handler")
    call_all_events("mined", event)
end)

script.on_event(defines.events.on_robot_mined_entity, function(event)
    --print("Entity Robot Mined Handler")
    call_all_events("robo_mined", event)
end)

script.on_event(defines.events.on_player_rotated_entity, function(event)
    --print("Entity rotated Handler")
    call_all_events("rotated", event)
end)

script.on_event(defines.events.on_entity_destroyed, function(event)
    --print("Entity Destroyed Handler")
    call_all_events("destroyed", event)
end)

script.on_event(defines.events.on_entity_died, function(event)
    --print("Entity Died Handler")
    call_all_events("died", event)
end)

script.on_event(defines.events.on_entity_damaged, function(event)
    --print("Entity Damaged Handler")
    call_all_events("damaged", event)
end)
