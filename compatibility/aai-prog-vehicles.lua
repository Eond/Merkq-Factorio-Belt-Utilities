
remote.add_interface(generate_name("aai-prog-vehicles"), {
    aai_programmable_vehicles_non_combat_whitelist = function()
        local names = entity_tracker_tracked_types()
        local list  = { }
        for _, name in pairs(names) do
            if string.find(name, "main") == nil then
                table.insert(list, name)
            end
        end
        return list
    end,
})