local prefix   = "__compound_tracker__"
local children = "children"
local parents  = "parents"

local function setup_global()
    --Initilize tables if empty
    if global[prefix] == nil then
        global[prefix] = { }
    end
    if global[prefix][parents] == nil then
        global[prefix][parents] = { }
    end
    if global[prefix][children] == nil then
        global[prefix][children] = { }
    end
end

function compound_tracker_save_child(parent, child, child_info)
    if parent == nil then
        error("Parent is nil!")
    end
    if parent.valid == false then
        error("Parent is invalid!")
    end
    if parent.unit_number == nil then
        error("Parent has no unit number!")
    end
    if child == nil then
        error("Child is nil!")
    end
    if child.valid == false then
        error("Child is invalid!")
    end
    if child.unit_number == nil then
        error("Child has no unit number!")
    end
    setup_global()
    local p_id = parent.unit_number
    local c_id = child.unit_number
    if global[prefix][parents][p_id] == nil then
        global[prefix][parents][p_id] = {}
    end
    if global[prefix][children][c_id] ~= nil and global[prefix][children][c_id] ~= p_id then
        error("Unit ID '" .. tostring(c_id) .. "' already has a parent!")
    end
    script.register_on_entity_destroyed(parent)
    global[prefix][children][c_id] = p_id
    table.insert(global[prefix][parents][p_id], {
        id    = c_id,
        info  = child_info,
    })
end

function compound_tracker_get_children_from_id(parent_id)
    setup_global()
    return global[prefix][parents][parent_id]
end

function compound_tracker_get_children(parent)
    if parent == nil or parent.valid == false or parent.unit_number == nil then
        return {}
    end
    setup_global()
    return global[prefix][parents][parent.unit_number]
end

function compound_tracker_get_parent_id(child)
    if child == nil or child.valid == false or child.unit_number == nil then
        return nil
    end
    setup_global()
    return global[prefix][children][child.unit_number]
end

function compound_tracker_remove_child(child)
    local parent_id = compound_tracker_get_parent_id(child)
    if parent_id == nil then
        return
    end
    local child_id     = child.unit_number
    local all_children = compound_tracker_get_children_from_id(parent_id)
    local new_children = { }
    for _, entry in pairs(all_children) do
        if entry.id ~= child_id then
            table.insert(new_children, entry)
        end
    end
    global[prefix][children][child_id] = nil
    global[prefix][parents][parent_id] = new_children
end

function __on_entity_destroyed_compound_tracker_parent_destroyed(event)
    setup_global()
    -- Also destroy all children
    if event.unit_number == nil then
        return
    end
    local all_children = global[prefix][parents][event.unit_number]
    if all_children == nil then
        return
    end
    for _, entry in pairs(all_children) do
        local child = entity_tracker_get_entity(entry.id)
        if child ~= nil and child.valid == true then
            --game.print("Destroyed : " .. entry.info)
            child.destroy()
        end
        global[prefix][children][entry] = nil
    end
    global[prefix][parents][event.unit_number] = nil
end