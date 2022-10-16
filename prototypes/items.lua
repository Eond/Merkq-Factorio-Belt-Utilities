local items = {
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
}

-- Krastorio 2 Support
if mods["Krastorio2"] then
    table.insert(items, {
        type         = "item",
        name         = generate_name("lane-swapper-kr-advanced-main"),
        icon         = mod_name .. "/graphics/icons/kr-advanced-lane-swapper.png",
        icon_size    = 64,
        icon_mipmaps = 4,
        subgroup     = "belt",
        order        = "z[" .. generate_name("lane-swapper-main") .."]-d[" .. generate_name("lane-swapper-kr-advanced-main") .. "]",
        place_result = generate_name("lane-swapper-kr-advanced-main"),
        stack_size   = 50
    })
    table.insert(items, {
        type         = "item",
        name         = generate_name("lane-swapper-kr-superior-main"),
        icon         = mod_name .. "/graphics/icons/kr-superior-lane-swapper.png",
        icon_size    = 64,
        icon_mipmaps = 4,
        subgroup     = "belt",
        order        = "z[" .. generate_name("lane-swapper-main") .."]-e[" .. generate_name("lane-swapper-kr-superior-main") .. "]",
        place_result = generate_name("lane-swapper-kr-superior-main"),
        stack_size   = 50
    })


    table.insert(items, {
        type         = "item",
        name         = generate_name("lane-balance-kr-advanced-main"),
        icon         = mod_name .. "/graphics/icons/kr-advanced-lane-balancer.png",
        icon_size    = 64,
        icon_mipmaps = 4,
        subgroup     = "belt",
        order        = "y[" .. generate_name("lane-balance-main") .."]-d[" .. generate_name("lane-balance-kr-advanced-main") .. "]",
        place_result = generate_name("lane-balance-kr-advanced-main"),
        stack_size   = 50
    })
    table.insert(items, {
        type         = "item",
        name         = generate_name("lane-balance-kr-superior-main"),
        icon         = mod_name .. "/graphics/icons/kr-superior-lane-balancer.png",
        icon_size    = 64,
        icon_mipmaps = 4,
        subgroup     = "belt",
        order        = "y[" .. generate_name("lane-balance-main") .."]-e[" .. generate_name("lane-balance-kr-superior-main") .. "]",
        place_result = generate_name("lane-balance-kr-superior-main"),
        stack_size   = 50
    })
end


data:extend(items)