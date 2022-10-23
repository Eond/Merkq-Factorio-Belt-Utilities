local swappers = {}

local primed_lines = {
    splitter = { 5, 8 },
    link_out = { 1 },
    link_in  = { 1 },
}

local function get_surface()
    local surface = surface_tools_get("lane-swappers")
    if surface == nil then
        surface = surface_tools_create_32_by_32("lane-swappers", "refined-concrete", true)
    end
    return surface
end

local function build_swapper_backend(main, port1, port2)
    local surface  = get_surface()
    local x        = find_available_slot(surface, 2.0, 3.0)
    local pos      = {x = x, y = 0.0 }
    local entities = { }
    entities["source"] = surface.create_entity({
       name        = generate_name("itemless-linked-ultra-belt"),
       position    = pos,
       direction   = defines.direction.north,
       raise_built = true,
       create_build_effect_smoke = false
    })
    entities.source.linked_belt_type = "output"

    entities["splitter"] = surface.create_entity({
       name        = generate_name("itemless-ultra-splitter"),
       position    = { pos.x + 1, pos.y + 1 },
       direction   = defines.direction.south,
       raise_built = true,
       create_build_effect_smoke = false
    })

    entities["destination"] = surface.create_entity({
       name        = generate_name("itemless-linked-ultra-belt"),
       position    = { pos.x, pos.y + 2 },
       direction   = defines.direction.west,
       raise_built = true,
       create_build_effect_smoke = false
    })
    entities.destination.linked_belt_type = "input"

    entities["link_in"] = surface.create_entity({
       name        = generate_name("itemless-linked-ultra-belt"),
       position    = { pos.x + 1, pos.y + 2 },
       direction   = defines.direction.south,
       raise_built = true,
       create_build_effect_smoke = false
    })
    entities.link_in.linked_belt_type = "input"

    entities["link_out"] = surface.create_entity({
       name        = generate_name("itemless-linked-ultra-belt"),
       position    = { pos.x, pos.y + 3 },
       direction   = defines.direction.south,
       raise_built = true,
       create_build_effect_smoke = false
    })
    entities.link_out.linked_belt_type = "output"
    entities.link_out.connect_linked_belts(entities.link_in)

    --Fill the dead spots with something so players items
    --so they do not get basically eaten
    for name, entity in pairs(entities) do
        if primed_lines[name] ~= nil then
            for _, line in pairs(primed_lines[name]) do
                belt_fill_transport_line(entity, line, { name = "copper-plate"}, 14)
            end
        end
    end

    if port1.linked_belt_type == "input" then
        port1.connect_linked_belts(entities.source)
        port2.linked_belt_type = "output"
        port2.connect_linked_belts(entities.destination)
    else
        port1.connect_linked_belts(entities.destination)
        port2.linked_belt_type = "input"
        port2.connect_linked_belts(entities.source)
    end
    for name, entity in pairs(entities) do
        compound_tracker_save_child(main, entity, name)
    end
end

local function build_swapper(entity, player, robot)
    if entity.valid == false or swappers[entity.name] == nil then
        return
    end
    local children = build_visible_1_by_2(entity, swappers)
    if children == nil then
        game.print("Can not build swapper here!")
        game.print("Please replace/mine to fix!, and report this to me with what mods you have installed.")
        if player ~= nil then
            player.mine_entity(entity, true)
        end
        if robot ~= nil then
            entity.order_deconstruction(robot.force)
        end
        return
    end
    -- check if we have links, and if we do don't rebuild the backend
    if children.top.linked_belt_neighbour ~= nil and children.bottom.linked_belt_neighbour ~= nil then
        -- remove the the backend entities from the old parent
        local old_parent = compound_tracker_get_parent_id(children.top.linked_belt_neighbour)
        local children   = compound_tracker_get_children_from_id(old_parent)
        for _, entry in pairs(children) do
            if entry.info ~= "top" and entry.info ~= "bottom" then
                local child = entity_tracker_get_entity(entry.id)
                compound_tracker_remove_child(child)
                compound_tracker_save_child(entity, child, entry.info)
            end
        end
    else
        build_swapper_backend(entity, children.top, children.bottom)
    end
end



local function handle_mined(event)
    local entity = event.entity
    local buffer = event.buffer
    if swappers[entity.name] == nil then
        return
    end
    -- Need to get all the items from the children before it is destroyed
    -- Otherwise they will just get deleted
    local children = compound_tracker_get_children(entity)
    for _, entry in pairs(children) do
        local child = entity_tracker_get_entity(entry.id)
        if child ~= nil then
            local items = belt_get_items(child, primed_lines[entry.info])
            belt_empty(child, primed_lines[entry.info])
            for name, count in pairs(items) do
                buffer.insert({ name = name, count = count})
            end
        end
    end
end

function __on_load_lane_swapper()
    local speeds = {
        "base",
        "fast",
        "express",
        "kr-advanced",
        "kr-superior",
    }
    for _, speed in pairs(speeds) do
        local speed_str = ""
        if speed ~= "base" then
            speed_str = speed .. "-"
        end
        local main = generate_name("lane-swapper-" .. speed_str .. "main")
        local real = generate_name("lane-swapper-" .. speed_str .. "real")
        -- Make sure these entities automatically get tracked by the entity tracker.
        entity_tracker_track_type(main)
        entity_tracker_track_type(real)
        -- Initilize the lane swapper types
        swappers[main] = {
            real     = real,
            itemless = generate_name("itemless-linked-" .. speed_str .. "belt")
        }
    end
end

function __on_built_entity_lane_swapper(event)
    build_swapper(event.created_entity, game.players[event.player_index], nil)
end

function __on_robot_built_entity_lane_swapper(event)
    build_swapper(event.created_entity, nil, event.robot)
end

function __on_script_raised_built_lane_swapper(event)
    build_swapper(event.entity, nil, nil)
end

function __on_script_raised_revive_lane_swapper(event)
    build_swapper(event.entity, nil, nil)
end

function __on_player_rotated_entity_lane_swapper(event)
    local entity = event.entity
    if swappers[entity.name] == nil then
        return
    end
    rotate_1_by_2_children(entity, game.players[event.player_index])
end

function __on_player_mined_entity_lane_swapper(event)
    handle_mined(event)
end

function __on_robot_mined_entity_lane_swapper(event)
    handle_mined(event)
end

function __on_reconfig_lane_swapper()
    -- Make sure that if the proper technologies were researched
    -- that on reconfig they are enabled
    for index, force in pairs(game.forces) do
        local technologies = force.technologies
        local recipes      = force.recipes
        recipes[generate_name("lane-swapper-main")].enabled         = technologies["logistics"].researched
        recipes[generate_name("lane-swapper-fast-main")].enabled    = technologies["logistics-2"].researched
        recipes[generate_name("lane-swapper-express-main")].enabled = technologies["logistics-3"].researched
        -- Krastorio 2 Support
        if game.active_mods["Krastorio2"] then
            recipes[generate_name("lane-swapper-kr-advanced-main")].enabled = technologies["kr-logistic-4"].researched
            recipes[generate_name("lane-swapper-kr-superior-main")].enabled = technologies["kr-logistic-5"].researched
        end
    end
end