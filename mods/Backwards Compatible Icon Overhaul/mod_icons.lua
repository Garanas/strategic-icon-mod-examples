
-- we do not have any manual assignments
IconAssignments = { }

--- Entry point for scripted assignments. This function has a limited scope and any changes to the 
-- units and / or the projectiles do not affect the game as they are deep-copied of the originals. The 
-- functionality that is available are LOG, WARN, _ALERT, SPEW, repr and all table, mathand string 
-- operations and last the tonumber and type functions.
-- @param units All available unit blueprints.
-- @param projectiles All available projectile blueprints.
-- @param icons All the file names of the icons part of this mod.
function ScriptedIconAssignments (units, projectiles, icons)

    -- for performance
    local StringSub = string.sub
    local StringFind = string.find

    -- this is where we store the results
    local IconAssignments = {}

    -- loop over all the units
    for id, bp in units do

        -- retrieve the original strategic icon name
        local strategicIconName = bp.StrategicIconName

        -- this can be nil
        if strategicIconName then 

            -- check if we have the same identifier in our icon folder
            local partOfIconsMod = false 
            for k, icon in icons do 
                if StringSub(icon, -9) == '_rest.dds' and StringFind(icon, strategicIconName, 1, -9) then 
                    partOfIconsMod = true 
                    break
                end
            end

            -- if we do, use that instead
            if partOfIconsMod then 
                IconAssignments[id] = { BlueprintId = id, IconSet = bp.StrategicIconName }
            end
        end
    end
    
    return IconAssignments
end
