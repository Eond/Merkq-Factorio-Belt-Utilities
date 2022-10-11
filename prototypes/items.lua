data:extend({
    {
        type         = "item",
        name         = generate_name("lane-swapper-main"),
        icon         = mod_name .. "/graphics/icons/lane-swapper.png",
        icon_size    = 64,
        icon_mipmaps = 4,
        subgroup     = "belt",
        order        = "z[" .. generate_name("lane-swapper-main") .."]-a[" .. generate_name("lane-swapper-main") .. "]",
        place_result = generate_name("lane-swapper-main"),
        stack_size   = 50
    },
    {
        type         = "item",
        name         = generate_name("lane-swapper-fast-main"),
        icon         = mod_name .. "/graphics/icons/fast-lane-swapper.png",
        icon_size    = 64,
        icon_mipmaps = 4,
        subgroup     = "belt",
        order        = "z[" .. generate_name("lane-swapper-main") .."]-b[" .. generate_name("lane-swapper-fast-main") .. "]",
        place_result = generate_name("lane-swapper-fast-main"),
        stack_size   = 50
    },
    {
        type         = "item",
        name         = generate_name("lane-swapper-express-main"),
        icon         = mod_name .. "/graphics/icons/express-lane-swapper.png",
        icon_size    = 64,
        icon_mipmaps = 4,
        subgroup     = "belt",
        order        = "z[" .. generate_name("lane-swapper-main") .."]-c[" .. generate_name("lane-swapper-express-main") .. "]",
        place_result = generate_name("lane-swapper-express-main"),
        stack_size   = 50
    },
    {
        type         = "item",
        name         = generate_name("lane-balance-main"),
        icon         = mod_name .. "/graphics/icons/lane-balancer.png",
        icon_size    = 64,
        icon_mipmaps = 4,
        subgroup     = "belt",
        order        = "y[" .. generate_name("lane-balance-main") .."]-a[" .. generate_name("lane-balance-main") .. "]",
        place_result = generate_name("lane-balance-main"),
        stack_size   = 50
    },
    {
        type         = "item",
        name         = generate_name("lane-balance-fast-main"),
        icon         = mod_name .. "/graphics/icons/fast-lane-balancer.png",
        icon_size    = 64,
        icon_mipmaps = 4,
        subgroup     = "belt",
        order        = "y[" .. generate_name("lane-balance-main") .."]-b[" .. generate_name("lane-balance-fast-main") .. "]",
        place_result = generate_name("lane-balance-fast-main"),
        stack_size   = 50
    },
    {
        type         = "item",
        name         = generate_name("lane-balance-express-main"),
        icon         = mod_name .. "/graphics/icons/express-lane-balancer.png",
        icon_size    = 64,
        icon_mipmaps = 4,
        subgroup     = "belt",
        order        = "y[" .. generate_name("lane-balance-main") .."]-c[" .. generate_name("lane-balance-express-main") .. "]",
        place_result = generate_name("lane-balance-express-main"),
        stack_size   = 50
    },
})