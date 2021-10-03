
-- we do not have any manual assignments
UnitIconAssignments = {
    { BlueprintId = "ual0001", IconSet = "icon_commander_generic" },
 }

--- Entry point for scripted assignments. This function has a limited scope and any changes to the 
-- units and / or the projectiles do not affect the game as they are deep-copied of the originals. 
-- Functionality that is available:
--  - moho-log interaction: LOG, WARN, _ALERT, SPEW, error, assert
--  - debugging: repr
--  - compatibility: pairs, ipairs, next 
--  - typical statements: table, math (excluding math.random), string, tonumber, type, unpack, tostring
-- @param units All available unit blueprints.
-- @param projectiles All available projectile blueprints.
-- @param icons All the file names of the icons part of this mod.
function ScriptedIconAssignments (units, projectiles, icons)
end
