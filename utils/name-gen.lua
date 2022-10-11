mod_name          = "__beltutils__"
local mod_prefix  = "butil"
local name_prefix = "anfilts"

function generate_name(name)
    return name_prefix .. "-" .. mod_prefix .. "-" .. name
end