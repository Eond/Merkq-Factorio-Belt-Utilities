-- Entities here should not have an in game item
-- they are just entities. Hence itemless

local itemless_flags = {
    "hidden",
    "hide-alt-info",
    "no-copy-paste",
    "not-on-map",
    "not-blueprintable",
    "not-deconstructable",
    "not-rotatable",
    "not-repairable",
    "not-selectable-in-game",
    "not-in-made-in",
    "not-flammable",
    "not-in-kill-statistics"
}

local ultra_animation_set = {
    animation_set = {
        filename        = mod_name .. "/graphics/entity/ultra/belt/belt.png",
        width           = 64,
        height          = 64,
        frame_count     = 32,
        direction_count = 20,
        hr_version      = {
            filename        = mod_name .. "/graphics/entity/ultra/belt/belt-hr.png",
            width           = 128,
            height          = 128,
            frame_count     = 32,
            direction_count = 20,
            scale           = 0.5,
        },
    }
}

local ultra_speed = 0.03125 * 9

local empty_structure = {
    direction_in  = util.empty_sprite(),
    direction_out = util.empty_sprite(),
    direction_in_side_loading = util.empty_sprite(),
    direction_out_side_loading = util.empty_sprite(),
}

local ultra_underground = {
    direction_in = {
        sheet = {
            filename = mod_name .. "/graphics/entity/ultra/underground/underground.png",
            width    = 96,
            height   = 96,
            y        = 96,
            hr_version = {
                filename = mod_name .. "/graphics/entity/ultra/underground/underground-hr.png",
                width    = 192,
                height   = 192,
                y        = 192,
                scale    = 0.5
            }
        }
    },
    direction_out = {
        sheet = {
            filename = mod_name .. "/graphics/entity/ultra/underground/underground.png",
            width    = 96,
            height   = 96,
            hr_version = {
                filename = mod_name .. "/graphics/entity/ultra/underground/underground-hr.png",
                width    = 192,
                height   = 192,
                scale    = 0.5
            }
        }
    },
    direction_in_side_loading = {
        sheet = {
            filename = mod_name .. "/graphics/entity/ultra/underground/underground.png",
            width    = 96,
            height   = 96,
            y        = 288,
            hr_version = {
                filename = mod_name .. "/graphics/entity/ultra/underground/underground-hr.png",
                width    = 192,
                height   = 192,
                y        = 576,
                scale    = 0.5
            }
        }
    },
    direction_out_side_loading = {
        sheet = {
            filename = mod_name .. "/graphics/entity/ultra/underground/underground.png",
            width    = 96,
            height   = 96,
            y        = 192,
            hr_version = {
                filename = mod_name .. "/graphics/entity/ultra/underground/underground-hr.png",
                width    = 192,
                height   = 192,
                y        = 384,
                scale    = 0.5
            }
        }
    },
}

local dmg_immune = {
    { type = "physical",  percent = 100 },
    { type = "impact",    percent = 100 },
    { type = "poison",    percent = 100 },
    { type = "explosion", percent = 100 },
    { type = "fire",      percent = 100 },
    { type = "laser",     percent = 100 },
    { type = "acid",      percent = 100 },
    { type = "electric",  percent = 100 },
}

local entities = {
    {
        type               = "linked-belt",
        name               = generate_name("itemless-linked-belt"),
        allow_side_loading = true,
        speed              = base_speed,
        max_health         = 150,
        flags              = itemless_flags,
        collision_box      = { { -0.4, -0.4 }, { 0.4, 0.4 } },
        selection_box      = { {  0.0,  0.0 }, { 0.0, 0.0 } },
        resistances = {
            { type = "fire",   percent = 60 },
            { type = "impact", percent = 30 },
        },
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
        structure                   = empty_structure,
        animation_speed_coefficient = 32,
        belt_animation_set          = basic_belt_animation_set,
        fast_replaceable_group      = "linked-belts",
    }
}

--Various Linked Belts
local tmp              = table.deepcopy(entities[1])
tmp.name               = generate_name("itemless-linked-fast-belt")
tmp.speed              = base_speed * 2
tmp.max_health         = 160
tmp.belt_animation_set = fast_belt_animation_set
tmp.working_sound      = {
    sound = {
        filename = "__base__/sound/fast-underground-belt.ogg",
        volume = 0.27
    },
    persistent = true
}
table.insert(entities, tmp)

tmp                    = table.deepcopy(entities[1])
tmp.name               = generate_name("itemless-linked-express-belt")
tmp.speed              = base_speed * 3
tmp.max_health         = 170
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

if mods["Krastorio2"] then
    tmp                             = table.deepcopy(entities[1])
    tmp.name                        = generate_name("itemless-linked-kr-superior-belt")
    tmp.speed                       = base_speed * 6
    tmp.max_health                  = 200
    tmp.belt_animation_set          = express_belt_animation_set
    tmp.animation_speed_coefficient = 30
    tmp.working_sound               = {
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
    tmp                             = table.deepcopy(entities[1])
    tmp.name                        = generate_name("itemless-linked-kr-advanced-belt")
    tmp.speed                       = base_speed * 4
    tmp.max_health                  = 200
    tmp.belt_animation_set          = express_belt_animation_set
    tmp.animation_speed_coefficient = 30
    tmp.working_sound               = {
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

-- Ultra Belt Entities

table.insert(entities, {
    type               = "linked-belt",
    name               = generate_name("itemless-linked-ultra-belt"),
    allow_side_loading = true,
    speed              = ultra_speed,
    max_health         = 1000,
    flags              = itemless_flags,
    collision_box      = { { -0.4, -0.4 }, { 0.4, 0.4 } },
    selection_box      = { {  0.0,  0.0 }, { 0.0, 0.0 } },
    resistances        = dmg_immune,
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
    structure                   = ultra_underground,
    animation_speed_coefficient = 320,
    belt_animation_set          = ultra_animation_set,
})

table.insert(entities, {
    type               = "transport-belt",
    name               = generate_name("itemless-ultra-belt"),
    allow_side_loading = true,
    speed              = ultra_speed,
    max_health         = 1000,
    flags              = itemless_flags,
    collision_box      = { { -0.4, -0.4 }, { 0.4, 0.4 } },
    selection_box      = { {  0.0,  0.0 }, { 0.0, 0.0 } },
    resistances        = dmg_immune,
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
    structure = {
        direction_in  = empty_structure,
        direction_out = empty_structure
    },
    animation_speed_coefficient = 320,
    belt_animation_set          = ultra_animation_set,

    connector_frame_sprites        = transport_belt_connector_frame_sprites,
    circuit_wire_connection_points = circuit_connector_definitions["belt"].points,
    circuit_connector_sprites      = circuit_connector_definitions["belt"].sprites,
    circuit_wire_max_distance      = transport_belt_circuit_wire_max_distance
})

table.insert(entities, {
    type               = "splitter",
    name               = generate_name("itemless-ultra-splitter"),
    allow_side_loading = true,
    speed              = ultra_speed,
    max_health         = 1000,
    flags              = itemless_flags,
    collision_box      = { { -0.9, -0.4 }, { 0.9, 0.4 } },
    selection_box      = { {  0.0,  0.0 }, { 0.0, 0.0 } },
    resistances        = dmg_immune,
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
    structure = {
        north = {
            filename    = mod_name .. "/graphics/entity/ultra/splitter/north.png",
            frame_count = 32,
            line_length = 8,
            width       = 82,
            height      = 36,
            shift       = util.by_pixel(6, 0),
            hr_version  = {
                filename    = mod_name .. "/graphics/entity/ultra/splitter/north-hr.png",
                frame_count = 32,
                line_length = 8,
                width       = 160,
                height      = 70,
                shift       = util.by_pixel(7, 0),
                scale       = 0.5
            },
        },
        east = {
            filename    = mod_name .. "/graphics/entity/ultra/splitter/east.png",
            frame_count = 32,
            line_length = 8,
            width       = 46,
            height      = 44,
            shift       = util.by_pixel(4, 12),
            hr_version  = {
                filename    = mod_name .. "/graphics/entity/ultra/splitter/east-hr.png",
                frame_count = 32,
                line_length = 8,
                width       = 90,
                height      = 84,
                shift       = util.by_pixel(4, 13),
                scale       = 0.5
            },
        },
        south = {
            filename    = mod_name .. "/graphics/entity/ultra/splitter/south.png",
            frame_count = 32,
            line_length = 8,
            width       = 82,
            height      = 32,
            shift       = util.by_pixel(4, 0),
            hr_version  = {
                filename    = mod_name .. "/graphics/entity/ultra/splitter/south-hr.png",
                frame_count = 32,
                line_length = 8,
                width       = 164,
                height      = 64,
                shift       = util.by_pixel(4, 0),
                scale       = 0.5
            },
        },
        west = {
            filename    = mod_name .. "/graphics/entity/ultra/splitter/west.png",
            frame_count = 32,
            line_length = 8,
            width       = 46,
            height      = 44,
            shift       = util.by_pixel(6, 12),
            hr_version  = {
                filename    = mod_name .. "/graphics/entity/ultra/splitter/west-hr.png",
                frame_count = 32,
                line_length = 8,
                width       = 94,
                height      = 86,
                shift       = util.by_pixel(5, 12),
                scale       = 0.5
            },
        },
    },
    structure_patch = {
        north = util.empty_sprite(),
        south = util.empty_sprite(),
        east  = {
            filename    = mod_name .. "/graphics/entity/ultra/splitter/east-top-patch.png",
            frame_count = 32,
            line_length = 8,
            width       = 46,
            height      = 52,
            shift       = util.by_pixel(4, -20),
            hr_version  = {
                filename    = mod_name .. "/graphics/entity/ultra/splitter/east-top-patch-hr.png",
                frame_count = 32,
                line_length = 8,
                width       = 90,
                height      = 104,
                shift       = util.by_pixel(4, -20),
                scale       = 0.5
            },
        },
        west  = {
            filename    = mod_name .. "/graphics/entity/ultra/splitter/west-top-patch.png",
            frame_count = 32,
            line_length = 8,
            width       = 46,
            height      = 48,
            shift       = util.by_pixel(6, -18),
            hr_version  = {
                filename    = mod_name .. "/graphics/entity/ultra/splitter/west-top-patch-hr.png",
                frame_count = 32,
                line_length = 8,
                width       = 94,
                height      = 96,
                shift       = util.by_pixel(5, -18),
                scale       = 0.5
            },
        },
    },
    structure_animation_speed_coefficient = 1.2,
    structure_animation_movement_cooldown = 10,
    animation_speed_coefficient           = 320,
    belt_animation_set                    = ultra_animation_set,
})

data:extend(entities)