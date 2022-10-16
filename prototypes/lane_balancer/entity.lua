local entities = {
    {
        type = "simple-entity-with-owner",
        name = generate_name("lane-balance-main"),
        icon = mod_name .. "/graphics/icons/lane-balancer.png",
        icon_size = 64,
        icon_mipmaps = 4,
        flags = {
            "placeable-neutral",
            "player-creation",
        },
        mining_sound   = nil,
        max_health     = 150,
        selection_box  = { { -0.5, -1.0 }, { 0.5, 1.0 } },
        collision_box  = { { -0.4, -0.8 }, { 0.4, 0.8 } },
        resistances = {
            { type = "fire",   percent = 60 },
            { type = "impact", percent = 30 },
        },
        collision_mask = { "object-layer", "floor-layer", "transport-belt-layer", "water-tile" },
        minable        = { mining_time = 0.1, result = generate_name("lane-balance-main") },
        placeable_by   = { item = generate_name("lane-balance-main"), count = 1 },
        render_layer           = "water-tile",
        secondary_draw_order   = 0,
        picture                = get_1_by_2_picture("lane-balancer", nil),
        fast_replaceable_group = generate_name("lane-balancers"),
        next_upgrade           = generate_name("lane-balance-fast-main"),
    },
    {
        type               = "linked-belt",
        name               = generate_name("lane-balance-real"),
        allow_side_loading = true,
        speed              = base_speed,
        max_health         = 150,
        collision_box      = { { -0.4, -0.4 }, { 0.4, 0.4 } },
        selection_box      = { {  0.0,  0.0 }, { 0.0, 0.0 } },
        resistances = {
            { type = "fire",   percent = 60 },
            { type = "impact", percent = 30 },
        },
        flags = sub_entity_flag,
        working_sound = {
            sound = {
                filename = "__base__/sound/underground-belt.ogg",
                volume   = 0.2
            },
            max_sounds_per_type       = 2,
            audible_distance_modifier = 0.5,
            persistent                = true,
            use_doppler_shift         = false
        },
        structure                   = get_1_by_2_structure("lane-balancer", nil),
        animation_speed_coefficient = 32,
        belt_animation_set          = basic_belt_animation_set,
        fast_replaceable_group      = "linked-belts",
    }
}

local express_upgrade = nil

-- Krastorio 2 Support
if mods["Krastorio2"] then
    tmp_name         = generate_name("lane-balance-kr-advanced-main")
    tmp              = table.deepcopy(entities[1])
    tmp.name         = tmp_name
    tmp.icon         = mod_name .. "/graphics/icons/kr-advanced-lane-balancer.png"
    tmp.max_health   = 170
    tmp.picture      = get_1_by_2_picture("lane-balancer", "kr-advanced")
    tmp.next_upgrade = generate_name("lane-balance-kr-superior-main")
    tmp.minable      = { mining_time = 0.1, result = tmp_name }
    tmp.placeable_by = { item = tmp_name, count = 1 }
    express_upgrade  = tmp_name
    table.insert(entities, tmp)

    tmp                    = table.deepcopy(entities[2])
    tmp.name               = generate_name("lane-balance-kr-advanced-real")
    tmp.speed              = base_speed * 3
    tmp.structure          = get_1_by_2_structure("lane-balancer", "kr-advanced")
    tmp.belt_animation_set = express_belt_animation_set
    tmp.working_sound      = {
            sound = {
                filename = "__base__/sound/express-underground-belt.ogg",
                volume = 0.35
            },
            max_sounds_per_type       = 2,
            audible_distance_modifier = 0.5,
            persistent                = true,
            use_doppler_shift         = false
    }
    table.insert(entities, tmp)

    tmp_name         = generate_name("lane-balance-kr-superior-main")
    tmp              = table.deepcopy(entities[1])
    tmp.name         = tmp_name
    tmp.icon         = mod_name .. "/graphics/icons/kr-superior-lane-balancer.png"
    tmp.max_health   = 170
    tmp.picture      = get_1_by_2_picture("lane-balancer", "kr-superior")
    tmp.next_upgrade = nil
    tmp.minable      = { mining_time = 0.1, result = tmp_name }
    tmp.placeable_by = { item = tmp_name, count = 1 }
    table.insert(entities, tmp)

    tmp                    = table.deepcopy(entities[2])
    tmp.name               = generate_name("lane-balance-kr-superior-real")
    tmp.speed              = base_speed * 3
    tmp.structure          = get_1_by_2_structure("lane-balancer", "kr-superior")
    tmp.belt_animation_set = express_belt_animation_set
    tmp.working_sound      = {
            sound = {
                filename = "__base__/sound/express-underground-belt.ogg",
                volume = 0.35
            },
            max_sounds_per_type       = 2,
            audible_distance_modifier = 0.5,
            persistent                = true,
            use_doppler_shift         = false
    }
    table.insert(entities, tmp)
end

local tmp_name   = generate_name("lane-balance-fast-main")
local tmp        = table.deepcopy(entities[1])
tmp.name         = tmp_name
tmp.icon         = mod_name .. "/graphics/icons/fast-lane-balancer.png"
tmp.max_health   = 160
tmp.picture      = get_1_by_2_picture("lane-balancer", "fast")
tmp.next_upgrade = generate_name("lane-balance-express-main")
tmp.minable      = { mining_time = 0.1, result = tmp_name }
tmp.placeable_by = { item = tmp_name, count = 1 }
table.insert(entities, tmp)

tmp_name         = generate_name("lane-balance-express-main")
tmp              = table.deepcopy(entities[1])
tmp.name         = tmp_name
tmp.icon         = mod_name .. "/graphics/icons/express-lane-balancer.png"
tmp.max_health   = 170
tmp.picture      = get_1_by_2_picture("lane-balancer", "express")
tmp.next_upgrade = express_upgrade
tmp.minable      = { mining_time = 0.1, result = tmp_name }
tmp.placeable_by = { item = tmp_name, count = 1 }
table.insert(entities, tmp)


tmp                    = table.deepcopy(entities[2])
tmp.name               = generate_name("lane-balance-fast-real")
tmp.speed              = base_speed * 2
tmp.structure          = get_1_by_2_structure("lane-balancer", "fast")
tmp.belt_animation_set = fast_belt_animation_set
tmp.working_sound      = {
    sound = {
        filename = "__base__/sound/fast-underground-belt.ogg",
        volume = 0.27
    },
    persistent = true
}
table.insert(entities, tmp)

tmp                    = table.deepcopy(entities[2])
tmp.name               = generate_name("lane-balance-express-real")
tmp.speed              = base_speed * 3
tmp.structure          = get_1_by_2_structure("lane-balancer", "express")
tmp.belt_animation_set = express_belt_animation_set
tmp.working_sound      = {
    sound = {
        filename = "__base__/sound/express-underground-belt.ogg",
        volume = 0.35
    },
    max_sounds_per_type       = 2,
    audible_distance_modifier = 0.5,
    persistent                = true,
    use_doppler_shift         = false
}
table.insert(entities, tmp)


data:extend(entities)