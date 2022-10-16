if mods["Krastorio2"] then
    table.insert(data.raw.technology["kr-logistic-4"].effects, { type = "unlock-recipe", recipe = generate_name("lane-swapper-kr-advanced-main") })
    table.insert(data.raw.technology["kr-logistic-5"].effects, { type = "unlock-recipe", recipe = generate_name("lane-swapper-kr-superior-main") })

    table.insert(data.raw.technology["kr-logistic-4"].effects, { type = "unlock-recipe", recipe = generate_name("lane-balance-kr-advanced-main") })
    table.insert(data.raw.technology["kr-logistic-5"].effects, { type = "unlock-recipe", recipe = generate_name("lane-balance-kr-superior-main") })
end