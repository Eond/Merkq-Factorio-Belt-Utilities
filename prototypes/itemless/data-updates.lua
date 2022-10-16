-- Krastorio 2 Support
if mods["Krastorio2"] then
    local kr_adv = data.raw["underground-belt"]["kr-advanced-underground-belt"]
    local kr_sup = data.raw["underground-belt"]["kr-superior-underground-belt"]
    local my_adv = data.raw["linked-belt"][generate_name("itemless-linked-kr-advanced-belt")]
    local my_sup = data.raw["linked-belt"][generate_name("itemless-linked-kr-superior-belt")]

    my_adv.speed              = kr_adv.speed
    my_adv.max_health         = kr_adv.max_health
    my_adv.resistances        = kr_adv.resistances
    my_adv.belt_animation_set = kr_adv.belt_animation_set

    my_sup.speed              = kr_sup.speed
    my_sup.max_health         = kr_sup.max_health
    my_sup.resistances        = kr_sup.resistances
    my_sup.belt_animation_set = kr_sup.belt_animation_set
end