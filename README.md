# Custom Strategic Icons

With the [latest patch](https://github.com/FAForever/fa/pull/3450) of Forged Alliance Forever it is possible for people to make their own strategic icon overlay and see the icons in-game. This new approach is slightly involved as we require certain functionality to work, such as being able to turn the ui mod off in the mod manager. This repository contains a simple guide as to how you can start making your own, using open source and commercial tools.

Please use the example mods provided to help you get started.

## About the format (Direct Draw Surface / DDS)

All icons should be stored in the BC3 / DXT5 DDS format. This is an abbreviation for a Direct Draw Surface which is highly optimized for rendering with a GPU. In turn, you can't make icons using just paint. The game is able to transform other formats to the DDS format dynamically, but this typically looks worse than when you do it yourself.

The DDS format we use (BC3 / DXT5) is a compressed format for textures. This compression is not lossless and therefore it involves losing information while saving. It is therefore recommend you work on your icons in some other format, such as PNG, and convert them to the DDS format to preserve the original texture for editing. Using DXT5 has a limitation. Each block of 4x4 textures needs to have the same color and saturation in each pixel. If this is not the case, it will average it out during saving. This means that pixels in such a block can have different luminance (lighting, black / white) but they must be the same color (Hue) and saturation. This means you can't just make any icon and have it look good in-game. It requires a bit of trial-and-error to get a feeling for. We therefore recommend that you first experiment with what is possible, before making all your icons.

A unit requires four states:
 - `over`, as an example: `icon_air_air_over.dds`
 - rest, as an example: `icon_air_air_rest.dds`
 - `selected`, as an example: `icon_air_air_selected.dds`
 - `selectedover`, as an example: `icon_air_air_selectedover.dds`

The game expects all four to be availabe or it will not show an icon when a given state is reached. In particular, use the `Backwards Compatible Icon Overhaul` mod if you want to convert your Advanced Strategic Icons (ASI) installation.

## Distribution

Please note the license of the example mods:
 - BrewLAN UI Strategic Icon Overhaul Classic: The **icons** are distributed with the CC-BY-SA-NC 4.0 license. All rights reserved to Sean 'Balthazar' Wheeldon for the script.
 - BrewLAN UI Strategic Icon Overhaul Large: All rights reserved to Sean 'Balthazar' Wheeldon.
 - BrewLAN UI Strategic Icon Overhaul Small: All rights reserved to Sean 'Balthazar' Wheeldon.
 - Backwards Compatible Icon Overhaul: All the code has the GPLv3 license, the four example icons belong to the author of ASI.

Distributing adjusted icon packages through the vault is not permitted unless you have explicit authorisation by the right holder. You're free to use and adjust them for your own, personal use.

## About the custom-strategic-icons folder

Inside this folder you'll store all your icons. The folder should be in the root of your mod. As an example:

![](/images/example-a.png)

## About mod_icons.lua

Inside this file you'll define what units should have what icons. The file should be in the root of your mod. As an example:

![](/images/example-a.png)

An example of a basic file:

```lua
-- we do not have any manual assignments
IconAssignments = { }

--- Entry point for scripted assignments. This function has a limited scope and any changes to the 
-- units and / or the projectiles do not affect the game as they are deep-copied of the originals. The 
-- functionality that is available are LOG, WARN, _ALERT, SPEW and all table, math and string operations.
-- @param units All available unit blueprints.
-- @param projectiles All available projectile blueprints.
-- @param icons All the file names of the icons part of this mod.
function ScriptedIconAssignments (units, projectiles, icons)
    return { }
end
```

It contains two definitions:
 - `IconAssignments` This is a manual approach to assigning icons to units. It requires a format such as `{ BlueprintId = "UAL0001", IconSet = aeon_commander }` where you have a corresponding icon set that starts with `aeon_commander` in the `custom-strategic-icons` folder. 
 - `ScriptedIconAssignments` This is a scripted approach to assigning icons to units. It should return the same format as the manual assignment. This is for advanced users. The arguments are deep copies of all unit and projectile blueprints. You can see an example of how to do this in the example icon overhaul mods of Brewlan.

A script is case-sensitive. This means you need to have your capitals straigth. The syntax is typical lua. This guide does not inform you how to write valid Lua code - you can find numerous resources through a search engine online.

## Tools to make icons with

There are various tools out there that can help you make icons.
 - [Gimp](https://www.gimp.org/) An open source image editor that can load and save the DDS format by default.
 - [Adobe Photoshop](https://www.adobe.com/products/photoshop.html) in combination with [this opensource plugin](http://gametechdev.github.io/Intel-Texture-Works-Plugin/) or [this commercial (but free) plugin](https://developer.nvidia.com/nvidia-texture-tools-exporter). You need a developers account for the latter.

In general, make sure to load and save the transparency layer accordingly. Make sure you use the BC3 / DXT5 format when saving. And remember: the compression can mess with your icon. When you save the icon, close it in the editor and reload it you can inspect how it appears after compression (and how it appears in-game).
