local gears     = 4.0
local circuits  = 2.0
local items     = 2.0
local tier_2    = 2.0
local tier_3    = 4.0
local expensive = 2.0

data:extend({
{
    type            = "recipe",
    name            = generate_name("lane-swapper-main"),
    normal = {
        enabled         = false,
        energy_required = 1.0,
        result_count    = 1,
        result          = generate_name("lane-swapper-main"),
        ingredients     = {
            { name = "iron-gear-wheel",    amount = gears    },
            { name = "electronic-circuit", amount = circuits },
            { name = "transport-belt",     amount = items    },
        },
    },
    expensive = {
        enabled         = false,
        energy_required = 1.0,
        result_count    = 1,
        result          = generate_name("lane-swapper-main"),
        ingredients     = {
            { name = "iron-gear-wheel",    amount = gears    * 1.5 },
            { name = "electronic-circuit", amount = circuits * expensive },
            { name = "transport-belt",     amount = items    * expensive },
        },
    }
},
{
    type            = "recipe",
    name            = generate_name("lane-swapper-fast-main"),
    normal = {
        enabled         = false,
        energy_required = 2.0,
        result_count    = 1,
        result          = generate_name("lane-swapper-fast-main"),
        ingredients     = {
            { name = "iron-gear-wheel",                  amount = gears    * tier_2 },
            { name = "electronic-circuit",               amount = circuits * tier_2 },
            { name = generate_name("lane-swapper-main"), amount = items             },
        },
    },
    expensive = {
        enabled         = false,
        energy_required = 2.0,
        result_count    = 1,
        result          = generate_name("lane-swapper-fast-main"),
        ingredients     = {
            { name = "iron-gear-wheel",                  amount = gears    * tier_2 * expensive },
            { name = "electronic-circuit",               amount = circuits * tier_2 * expensive },
            { name = generate_name("lane-swapper-main"), amount = items             * expensive },
        },
    }
},
{
    type            = "recipe",
    name            = generate_name("lane-swapper-express-main"),
    category        = "crafting-with-fluid",
    normal = {
        enabled         = false,
        energy_required = 4.0,
        result_count    = 1,
        result          = generate_name("lane-swapper-express-main"),
        ingredients     = {
            { type = "fluid", name = "lubricant",             amount = 20                },
            { name = "iron-gear-wheel",                       amount = gears    * tier_3 },
            { name = "advanced-circuit",                      amount = circuits * 2.5    },
            { name = generate_name("lane-swapper-fast-main"), amount = items             },
        },
    },
    expensive = {
        enabled         = false,
        energy_required = 4.0,
        result_count    = 1,
        result          = generate_name("lane-swapper-express-main"),
        ingredients     = {
            { type = "fluid", name = "lubricant",             amount =  20                * 1.5 },
            { name = "iron-gear-wheel",                       amount = gears    * tier_3 * expensive },
            { name = "advanced-circuit",                      amount = circuits * 2.5    * expensive },
            { name = generate_name("lane-swapper-fast-main"), amount = items             * expensive },
        },
    }
},
{
    type            = "recipe",
    name            = generate_name("lane-balance-main"),
    normal = {
        enabled         = false,
        energy_required = 1.0,
        result_count    = 1,
        result          = generate_name("lane-balance-main"),
        ingredients     = {
            { name = "iron-stick",         amount = gears    * 1.00 },
            { name = "iron-gear-wheel",    amount = gears    * 1.25 },
            { name = "electronic-circuit", amount = circuits * 2.00 },
            { name = "transport-belt",     amount = items           },
        },
    },
    expensive = {
        enabled         = false,
        energy_required = 1.0,
        result_count    = 1,
        result          = generate_name("lane-balance-main"),
        ingredients     = {
            { name = "iron-stick",         amount = gears    * 1.00 * expensive },
            { name = "iron-gear-wheel",    amount = gears    * 1.25 * 1.5       },
            { name = "electronic-circuit", amount = circuits * 2.00 * expensive },
            { name = "transport-belt",     amount = items           * expensive },

        },
    }
},
{
    type            = "recipe",
    name            = generate_name("lane-balance-fast-main"),
    normal = {
        enabled         = false,
        energy_required = 2.0,
        result_count    = 1,
        result          = generate_name("lane-balance-fast-main"),
        ingredients     = {
            { name = "iron-gear-wheel",                  amount = gears    * 1.25 * tier_2 },
            { name = "electronic-circuit",               amount = circuits * 2.00 * tier_2 },
            { name = generate_name("lane-balance-main"), amount = items                    },
        },
    },
    expensive = {
        enabled         = false,
        energy_required = 2.0,
        result_count    = 1,
        result          = generate_name("lane-balance-fast-main"),
        ingredients     = {
            { name = "iron-gear-wheel",                  amount = gears    * 1.25 * tier_2 * expensive },
            { name = "electronic-circuit",               amount = circuits * 2.00 * tier_2 * expensive },
            { name = generate_name("lane-balance-main"), amount = items                    * expensive },

        },
    }
},
{
    type     = "recipe",
    name     = generate_name("lane-balance-express-main"),
    category = "crafting-with-fluid",
    normal   = {
        enabled         = false,
        energy_required = 4.0,
        result_count    = 1,
        result          = generate_name("lane-balance-express-main"),
        ingredients     = {
            { type = "fluid", name = "lubricant",             amount = 30                       },
            { name = "iron-gear-wheel",                       amount = gears    * 1.25 * tier_3 },
            { name = "advanced-circuit",                      amount = circuits * 3.00          },
            { name = generate_name("lane-balance-fast-main"), amount = items                    },
        },
    },
    expensive = {
        enabled         = false,
        energy_required = 4.0,
        result_count    = 1,
        result          = generate_name("lane-balance-express-main"),
        ingredients     = {
            { type = "fluid", name = "lubricant",             amount = 30                       * 1.5       },
            { name = "iron-gear-wheel",                       amount = gears    * 1.25 * tier_3 * expensive },
            { name = "advanced-circuit",                      amount = circuits * 3.00          * expensive },
            { name = generate_name("lane-balance-fast-main"), amount = items                    * expensive },

        },
    }
},
})

table.insert(data.raw.technology["logistics"].effects,   { type = "unlock-recipe", recipe = generate_name("lane-swapper-main") })
table.insert(data.raw.technology["logistics-2"].effects, { type = "unlock-recipe", recipe = generate_name("lane-swapper-fast-main") })
table.insert(data.raw.technology["logistics-3"].effects, { type = "unlock-recipe", recipe = generate_name("lane-swapper-express-main") })

table.insert(data.raw.technology["logistics"].effects,   { type = "unlock-recipe", recipe = generate_name("lane-balance-main") })
table.insert(data.raw.technology["logistics-2"].effects, { type = "unlock-recipe", recipe = generate_name("lane-balance-fast-main") })
table.insert(data.raw.technology["logistics-2"].effects, { type = "unlock-recipe", recipe = generate_name("lane-balance-express-main") })