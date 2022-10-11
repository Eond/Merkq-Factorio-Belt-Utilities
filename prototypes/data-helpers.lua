empty_structure = {
    direction_in  = util.empty_sprite(),
    direction_out = util.empty_sprite(),
    direction_in_side_loading = util.empty_sprite(),
    direction_out_side_loading = util.empty_sprite(),
}

sub_entity_flags = {
    "hide-alt-info",
    "no-copy-paste",
    "not-selectable-in-game",
    "not-in-made-in",
    "not-flammable",
    "not-in-kill-statistics",
}

base_speed  = 0.03125

function get_1_by_2_structure(folder, speed)
    local file    = "structure-hr.png"
    local file_hr = "structure-hr.png"
    if speed ~= nil and #speed > 0 then
        file    = speed .. "-" .. file
        file_hr = speed .. "-" .. file_hr
    end
    return {
        direction_in = {
            sheet = {
                filename = mod_name .. "/graphics/entity/" .. folder .. "/" .. file,
                width    = 96,
                height   = 96,
                hr_version = {
                    filename = mod_name .. "/graphics/entity/" .. folder .. "/" .. file,
                    width    = 192,
                    height   = 192,
                    scale    = 0.47,
                    shift    = util.by_pixel(0, -14),
                    y        = 192
                }
            }
        },
        direction_out = {
            sheet = {
                filename = mod_name .. "/graphics/entity/" .. folder .. "/" .. file,
                width    = 96,
                height   = 96,
                hr_version = {
                    filename = mod_name .. "/graphics/entity/" .. folder .. "/" .. file,
                    width    = 192,
                    height   = 192,
                    scale    = 0.47,
                    shift    = util.by_pixel(0, -14),
                }
            }
        },
        direction_in_side_loading = {
            sheet = {
                filename = mod_name .. "/graphics/entity/" .. folder .. "/" .. file,
                width    = 96,
                height   = 96,
                hr_version = {
                    filename = mod_name .. "/graphics/entity/" .. folder .. "/" .. file,
                    width    = 192,
                    height   = 192,
                    scale    = 0.47,
                    shift    = util.by_pixel(0, -14),
                    y        = 576,
                }
            }
        },
        direction_out_side_loading = {
            sheet = {
                filename = mod_name .. "/graphics/entity/" .. folder .. "/" .. file,
                width    = 96,
                height   = 96,
                hr_version = {
                    filename = mod_name .. "/graphics/entity/" .. folder .. "/" .. file,
                    width    = 192,
                    height   = 192,
                    scale    = 0.47,
                    shift    = util.by_pixel(0, -14),
                    y        = 384,
                }
            }
        },
    }
end

function get_1_by_2_picture(folder, speed)
    local file    = ".png"
    local file_hr = "-hr.png"
    if speed ~= nil and #speed > 0 then
        file    = "-" .. speed .. file
        file_hr = "-" .. speed .. file_hr
    end
    return {
        north = {
            filename = mod_name .. "/graphics/entity/" .. folder .. "/north" .. file,
            width    = 64,
            height   = 128,
            scale    = 0.95,
            hr_version = {
                filename = mod_name .. "/graphics/entity/" .. folder .. "/north" .. file_hr,
                width    = 128,
                height   = 256,
                scale    = 0.47,
            },
        },
        south = {
            filename = mod_name .. "/graphics/entity/" .. folder .. "/south" .. file,
            width    = 64,
            height   = 128,
            scale    = 0.95,
            hr_version = {
                filename = mod_name .. "/graphics/entity/" .. folder .. "/south" .. file_hr,
                width    = 128,
                height   = 256,
                scale    = 0.47,
            },
        },
        east = {
            filename = mod_name .. "/graphics/entity/" .. folder .. "/east" .. file,
            width    = 128,
            height   = 64,
            scale    = 0.93,
            shift    = util.by_pixel(0, 3),
            hr_version = {
                filename = mod_name .. "/graphics/entity/" .. folder .. "/east" .. file_hr,
                width    = 256,
                height   = 128,
                scale    = 0.47,
                shift    = util.by_pixel(0, 3),
            },
        },
        west = {
            filename = mod_name .. "/graphics/entity/" .. folder .. "/west" .. file,
            width    = 128,
            height   = 64,
            scale    = 0.93,
            shift    = util.by_pixel(0, 2),
            hr_version = {
                filename = mod_name .. "/graphics/entity/" .. folder .. "/west" .. file_hr,
                width    = 256,
                height   = 128,
                scale    = 0.47,
                shift    = util.by_pixel(0, 3),
            },
        },
    }
end