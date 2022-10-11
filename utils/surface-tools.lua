function surface_tools_get_name(name)
    local name = generate_name("surface-" .. name)
    return name
end

function surface_tools_init_chunk(surface, x, y, tile_name)
    surface.set_chunk_generated_status({ x, y }, defines.chunk_generated_status.entities)
    surface.set_chunk_generated_status({ x - 1, y + 0 }, defines.chunk_generated_status.entities)
    surface.set_chunk_generated_status({ x - 1, y + 1 }, defines.chunk_generated_status.entities)
    surface.set_chunk_generated_status({ x - 1, y - 1 }, defines.chunk_generated_status.entities)
    surface.set_chunk_generated_status({ x + 1, y + 0 }, defines.chunk_generated_status.entities)
    surface.set_chunk_generated_status({ x + 1, y + 1 }, defines.chunk_generated_status.entities)
    surface.set_chunk_generated_status({ x + 1, y - 1 }, defines.chunk_generated_status.entities)
    surface.set_chunk_generated_status({ x + 0, y + 1 }, defines.chunk_generated_status.entities)
    surface.set_chunk_generated_status({ x + 0, y - 1 }, defines.chunk_generated_status.entities)
    local tiles = {}
    local x2 = x * 32
    local y2 = y * 32
    for j = 0, 31 do
        for i = 0, 31 do
            table.insert(tiles, {
                name     = tile_name,
                position = { x2 + j, y2 + i }
            })
        end
    end
    surface.set_tiles(tiles)
end

function surface_tools_create_32_by_32(name, init_tile, freeze_day)
    local full_name = surface_tools_get_name(name)
    local surface   = game.create_surface(full_name, { width = 2, height = 2 })
    surface.freeze_daytime = freeze_day
    -- Initialize some chunks and tiles
    surface_tools_init_chunk(surface, 0, 0, init_tile)
    return surface
end

function surface_tools_get(name)
    local full_name = surface_tools_get_name(name)
    local surface   = game.get_surface(full_name)
    if surface == nil or surface.valid == false then
        return nil
    end
    return surface
end