function build_visible_1_by_2(entity, lookup)
    script.register_on_entity_destroyed(entity)
    local top_dir  = entity.direction
    local top_pos  = entity.position
    local top_type = "input"

    local bot_dir  = entity.direction
    local bot_pos  = entity.position
    local bot_type = "output"

    -- Now make adjustments based of parent's posistion and rotation

    if entity.direction == defines.direction.north then
        -- move top above bottom and set to output to
        -- items north when facing south
        top_pos.y = top_pos.y - 1
        top_type  = "output"
        top_dir   = defines.direction.south
        bot_type  = "input"
    end

    if entity.direction == defines.direction.south then
        top_pos.y = top_pos.y - 1
        bot_dir   = defines.direction.north
    end

    if entity.direction == defines.direction.east then
        top_pos.x = top_pos.x - 1
        bot_dir   = defines.direction.west
    end

    if entity.direction == defines.direction.west then
        top_pos.x = top_pos.x - 1
        top_dir   = defines.direction.east
        top_type  = "output"
        bot_type  = "input"
    end

    -- now that we have the positions properly set create
    -- the two linked belts

    -- bottom is the linked belt with the structure graphics
    local bot = entity.surface.create_entity({
       name         = lookup[entity.name].real,
       position     = bot_pos,
       direction    = bot_dir,
       force        = force,
       raise_built  = true,
       fast_replace = true,
       create_build_effect_smoke = false
    })
    -- top is the itemless linked belt with no structure sprite
    local top = entity.surface.create_entity({
       name         = lookup[entity.name].itemless,
       position     = top_pos,
       direction    = top_dir,
       force        = force,
       raise_built  = true,
       fast_replace = true,
       create_build_effect_smoke = false
    })

    -- Handle upgrade case, in wich case the belts
    -- will have neighbors
    local top_link = nil
    local bot_link = nil
    if top.linked_belt_neighbour ~= nil then
        top_link = top.linked_belt_neighbour
    end
    if bot.linked_belt_neighbour ~= nil then
        bot_link = bot.linked_belt_neighbour
    end
    top.disconnect_linked_belts()
    bot.disconnect_linked_belts()

    -- set the input and output directions on the linked belts
    top.linked_belt_type = top_type
    bot.linked_belt_type = bot_type
    top.destructible     = false
    bot.destructible     = false
    -- save the entites in my compound entity tracker to make handling other events
    -- easier, such as rotation, mining ect... easier
    compound_tracker_save_child(entity, top, "top")
    compound_tracker_save_child(entity, bot, "bottom")

    if top_link ~= nil and bot_link ~= nil then
        top.connect_linked_belts(top_link)
        bot.connect_linked_belts(bot_link)
    end
    return { bottom = bot, top = top }
end

function rotate_1_by_2_children(entity, player)
    local children = compound_tracker_get_children(entity)
    local top      = nil
    local bot      = nil
    for _, entry in pairs(children) do
        if entry.info == "top" then
            top = entity_tracker_get_entity(entry.id)
        end
        if entry.info == "bottom" then
            bot = entity_tracker_get_entity(entry.id)
        end
        if bot ~= nil and top ~= nil then
            break
        end
    end
    if top == nil or bot == nil then
        -- should not happen, but probably want to write some kind
        -- of function to handle this error and rebuild the structure.
        game.print("Compound Entity is corrupt, will mine the entity")
        game.print("Please replace to fix!, and report this to me")
        player.mine_entity(entity, true)
        return
    end

    -- Save the links so we can swap them
    local top_link = top.linked_belt_neighbour
    local bot_link = bot.linked_belt_neighbour
    -- Disconnect so we can change type
    top.disconnect_linked_belts()
    bot.disconnect_linked_belts()

    if top.linked_belt_type == "input" then
        top.linked_belt_type = "output"
        bot.linked_belt_type = "input"
    else
        top.linked_belt_type = "input"
        bot.linked_belt_type = "output"
    end

    -- Reconnect swapping top to bottom and bottom to topd
    bot.connect_linked_belts(top_link)
    top.connect_linked_belts(bot_link)
end

function belt_get_items(entity, skip_lines)
    local skips = { }
    if type(skip_lines) == "table" then
        for _, entry in pairs(skip_lines) do
            skips[entry] = entry
        end
    end

    local lines = entity.get_max_transport_line_index()
    local items = { }

    for i = 1, lines do
        -- if we don't skip this line add it to the totals
        if skips[i] == nil then
            local line     = entity.get_transport_line(i)
            local contents = line.get_contents()
            for name, count in pairs(contents) do
                if items[name] == nil then
                    items[name] = 0
                end
                items[name] = items[name] + count
            end
        end
    end

    return items
end

function belt_empty(entity, skip_lines)
    local skips = { }
    if type(skip_lines) == "table" then
        for _, entry in pairs(skip_lines) do
            skips[entry] = entry
        end
    end
    local lines = entity.get_max_transport_line_index()
    for i = 1, lines do
        if skips[i] == nil then
            entity.get_transport_line(i).clear()
        end
    end
end

function belt_fill_transport_line(belt, line_no, item, steps)
    -- Probably not the best way to this but just step along till every
    -- we reach the number of steps.
    local line = belt.get_transport_line(line_no)
    line.insert_at_back(item)
    for i = 0, steps do
        local p = i * 0.05
        if line.can_insert_at(p) then
            line.insert_at(p, item)
        end
    end
end

function find_available_slot(surface, stride, depth)
    --Find first free slot
    local x = 0.0
    while(true) do
        local tile = surface.get_tile(x, 0)
        if tile.valid ~= true or tile.name == "out-of-map" then
            surface_tools_init_chunk(surface, x / 32, 0, 'refined-concrete')
        end
        local entities = surface.find_entities({ { x, 0.0 }, { x + stride, depth} })
        --game.print("Count: " .. tostring(#entities))
        if #entities == 0 then
            break
        end
        x = x + stride
    end
    --game.print("Using Slot: " .. tostring(x))
    return x
end