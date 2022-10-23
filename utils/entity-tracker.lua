local prefix = "__entity_tracker__"
local e_list = "entities"
local types  = {}

local function setup_global()
    if global[prefix] == nil then
        global[prefix] = {}
    end
    if global[prefix][e_list] == nil then
        global[prefix][e_list] = {}
    end
end

local function save_entity(entity)
    setup_global()
    script.register_on_entity_destroyed(entity)
    global[prefix][e_list][entity.unit_number] = entity
    --print("Saved: " .. entity.name .. ", ID: " .. entity.unit_number)
    return true
end

local function remove_entity(unit_number)
    if unit_number == nil or type(unit_number) ~= "number" then
        return
    end
    setup_global()
    global[prefix][e_list][unit_number] = nil
    --print("Removed Unit Number: " .. unit_number)
end

local function get_entity(unit_number)
    if unit_number == nil or type(unit_number) ~= "number" then
        return nil
    end
    setup_global()
    return global[prefix][e_list][uint_number]
end

local function entity_tracker_process_new_entity(entity)
    setup_global()
    if entity == nil or entity.valid == false or entity.unit_number == nil then
        return false
    end
    if entity.name == "entity-ghost" then
        return false
    end
    if types[entity.name] ~= true then
        return false
    end
    return save_entity(entity)
end

function entity_tracker_track_type(name)
    types[name] = true
end

function entity_tracker_untrack_type(name)
    types[name] = false
end

function entity_tracker_tracked_types()
    local names = { }
    for i, entry in pairs(types) do
        table.insert(names, i)
    end
    return names
end

function entity_tracker_get_entity(unit_number)
    setup_global()
    local entity = global[prefix][e_list][unit_number]
    if entity == nil or entity.valid == false then
        remove_entity(unit_number)
        return nil
    end
    return entity
end

function entity_tracker_save_entity(entity)
    return save_entity(entity)
end

function __on_built_entity_tracker(event)
    entity_tracker_process_new_entity(event.created_entity)
end

function __on_robot_built_entity_tracker(event)
    entity_tracker_process_new_entity(event.created_entity)
end

function __on_script_raised_built_tracker(event)
    entity_tracker_process_new_entity(event.entity)
end

function __on_script_raised_revive_tracker(event)
    entity_tracker_process_new_entity(event.entity)
end

function __on_entity_destroyed_tracker(event)
    remove_entity(event.unit_number)
end