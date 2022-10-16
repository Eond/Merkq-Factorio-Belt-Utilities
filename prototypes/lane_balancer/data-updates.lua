-- Krastorio 2 Support
if mods["Krastorio2"] then
    local kr_adv = data.raw["underground-belt"]["kr-advanced-underground-belt"]
    local kr_sup = data.raw["underground-belt"]["kr-superior-underground-belt"]

    local my_adv_main = data.raw["simple-entity-with-owner"][generate_name("lane-balance-kr-advanced-main")]
    local my_adv_real = data.raw["linked-belt"][generate_name("lane-balance-kr-advanced-real")]

    my_adv_main.max_health         = kr_adv.max_health
    my_adv_main.resistances        = kr_adv.resistances

    my_adv_real.speed              = kr_adv.speed
    my_adv_real.max_health         = kr_adv.max_health
    my_adv_real.resistances        = kr_adv.resistances
    my_adv_real.belt_animation_set = kr_adv.belt_animation_set

    local my_sup_main = data.raw["simple-entity-with-owner"][generate_name("lane-balance-kr-superior-main")]
    local my_sup_real = data.raw["linked-belt"][generate_name("lane-balance-kr-superior-real")]

    my_sup_main.max_health         = kr_sup.max_health
    my_sup_main.resistances        = kr_sup.resistances

    my_sup_real.speed              = kr_sup.speed
    my_sup_real.max_health         = kr_sup.max_health
    my_sup_real.resistances        = kr_sup.resistances
    my_sup_real.belt_animation_set = kr_sup.belt_animation_set
end