data:extend({
    {
        type = "simple-entity-with-owner",
        --type = "transport-belt",
        name = generate_name("lane-swapper-main"),
        icon = mod_name .. "/graphics/icons/lane-swapper.png",
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
        minable        = { mining_time = 0.1, result = generate_name("lane-swapper-main") },
        placeable_by   = { item = generate_name("lane-swapper-main"), count = 1 },
        -- Set the draw layer as low as I can and make sure the sprite scaled small enough
        -- that the entities on top hide it. Ideally I would have an entity that is visible
        -- when placing and then becames transparent after placed. The power-switch can do
        -- that since I can toggle the animation between on and off states, but it does not
        -- support rotation.
        render_layer           = "water-tile",
        secondary_draw_order   = 0,
        picture                = get_1_by_2_picture("lane-swapper", nil),
        fast_replaceable_group = generate_name("lane-swappers"),
        next_upgrade           = generate_name("lane-swapper-fast-main"),
    },
    {
        type               = "linked-belt",
        name               = generate_name("lane-swapper-real"),
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
        structure                   = get_1_by_2_structure("lane-swapper", nil),
        animation_speed_coefficient = 32,
        belt_animation_set          = basic_belt_animation_set,
        fast_replaceable_group      = "linked-belts",
    },
    {
        type = "simple-entity-with-owner",
        name = generate_name("lane-swapper-fast-main"),
        icon = mod_name .. "/graphics/icons/fast-lane-swapper.png",
        icon_size = 64,
        icon_mipmaps = 4,
        flags = {
            "placeable-neutral",
            "player-creation",
        },
        mining_sound   = nil,
        max_health     = 160,
        selection_box  = { { -0.5, -1.0 }, { 0.5, 1.0 } },
        collision_box  = { { -0.4, -0.8 }, { 0.4, 0.8 } },
        resistances = {
            { type = "fire",   percent = 60 },
            { type = "impact", percent = 30 },
        },
        collision_mask         = { "object-layer", "floor-layer", "transport-belt-layer", "water-tile" },
        minable                = { mining_time = 0.1, result = generate_name("lane-swapper-fast-main") },
        placeable_by           = { item = generate_name("lane-swapper-fast-main"), count = 1 },
        render_layer           = "water-tile",
        secondary_draw_order   = 0,
        picture                = get_1_by_2_picture("lane-swapper", "fast"),
        fast_replaceable_group = generate_name("lane-swappers"),
        next_upgrade           = generate_name("lane-swapper-express-main"),
    },
    {
        type               = "linked-belt",
        name               = generate_name("lane-swapper-fast-real"),
        allow_side_loading = true,
        speed              = base_speed * 2,
        max_health         = 160,
        collision_box      = { { -0.4, -0.4 }, { 0.4, 0.4 } },
        selection_box      = { {  0.0,  0.0 }, { 0.0, 0.0 } },
        resistances = {
            { type = "fire",   percent = 60 },
            { type = "impact", percent = 30 },
        },
        flags = sub_entity_flag,
        working_sound = {
            sound = {
                filename = "__base__/sound/fast-underground-belt.ogg",
                volume = 0.27
            },
            persistent = true
        },
        structure                   = get_1_by_2_structure("lane-swapper", "fast"),
        animation_speed_coefficient = 32,
        belt_animation_set          = fast_belt_animation_set,
        fast_replaceable_group      = "linked-belts",
    },
    {
        type = "simple-entity-with-owner",
        name = generate_name("lane-swapper-express-main"),
        icon = mod_name .. "/graphics/icons/express-lane-swapper.png",
        icon_size = 64,
        icon_mipmaps = 4,
        flags = {
            "placeable-neutral",
            "player-creation",
        },
        mining_sound   = nil,
        max_health     = 170,
        selection_box  = { { -0.5, -1.0 }, { 0.5, 1.0 } },
        collision_box  = { { -0.4, -0.8 }, { 0.4, 0.8 } },
        resistances = {
            { type = "fire",   percent = 60 },
            { type = "impact", percent = 30 },
        },
        collision_mask         = { "object-layer", "floor-layer", "transport-belt-layer", "water-tile" },
        minable                = { mining_time = 0.1, result = generate_name("lane-swapper-express-main") },
        placeable_by           = { item = generate_name("lane-swapper-express-main"), count = 1 },
        render_layer           = "water-tile",
        secondary_draw_order   = 0,
        picture                = get_1_by_2_picture("lane-swapper", "express"),
        fast_replaceable_group = generate_name("lane-swappers"),
    },
    {
        type               = "linked-belt",
        name               = generate_name("lane-swapper-express-real"),
        allow_side_loading = true,
        speed              = base_speed * 3,
        max_health         = 170,
        collision_box      = { { -0.4, -0.4 }, { 0.4, 0.4 } },
        selection_box      = { {  0.0,  0.0 }, { 0.0, 0.0 } },
        resistances = {
            { type = "fire",   percent = 60 },
            { type = "impact", percent = 30 },
        },
        flags = sub_entity_flag,
        working_sound = {
            sound = {
                filename = "__base__/sound/express-underground-belt.ogg",
                volume = 0.35
            },
            max_sounds_per_type       = 2,
            audible_distance_modifier = 0.5,
            persistent                = true,
            use_doppler_shift         = false
        },
        structure                   = get_1_by_2_structure("lane-swapper", "express"),
        animation_speed_coefficient = 32,
        belt_animation_set          = express_belt_animation_set,
        fast_replaceable_group      = "linked-belts",
    }
})