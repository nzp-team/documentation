% Waypointing - NZ:P Mapping Documentation
# Waypointing

## Introduction

![Zombies pathfinding between waypoint nodes on Nacht Der Untoten.](../res/images/Waypoint_Pathing.webp)

_Nazi Zombies: Portable_ makes use of a waypointing system to define nodes that zombies may path between. This allows for a fairly simple and intuitive, albeit limited, way to allow mappers to create custom pathfinding for their maps.

Waypoints can be edited directly in-game via the waypoint editing mode, foregoing the need to recompile the map when creating or adjusting waypoints. This mode can be accessed via the command `waypoint_mode` cvar.
Saving a set of waypoints via this mode will generate a `.way` file within the maps folder of NZ:P; a plain-text file containing data for each node.

## Interacting with Waypoints

![(Left to right) Blue-Default, Yellow-Selected, Red-Linked to Current, Special-Used for Doors (Same 3 colours as previous). ](../res/images/waypoint_types.webp)

| Actions | Description |
|---|---| 
| Create | Creates a default (blue) waypoint node at the players position. | 
| Select | Selects waypoint node currently being aimed at. | 
| Link  | Link selected (yellow) node to aimed at default (blue) node. | 
| Remove  | Deletes current selected (yellow) node. | 
| Move  | Move current selected (yellow) node to player position. | 
| Create Special | Converts selected (yellow) node to a special node. Must be adjacent to a valid `func_nzp_door`. | 

## Special Waypoints

Special Waypoint nodes are used in conjunction with a valid `func_nzp_door` to prevent zombies from attempting to path through currently closed doors.

A valid `func_nzp_door` requires an ID to be set in the `wayTarget` entity field. Targetting this `wayTarget` within waypoint mode is as simple as placing a waypoint node within the door entity you have created, and creating a special entity
whilst this node is selected. Correct use of this function can be clarifyed by a console output.

## Pathing Behaviour

Zombies will move along a path dictated by the mapper through connected waypoint nodes until they are within sight range to path to a player on their own (Where "Sight" is dictated by both the zombies shins, chest and forehead being able to see the player).

When zombies reacquire a path to the player (Whether that be after hopping a barricade post-spawn, or in attempt to find the player after they have teleported outside and back into the map.), 
they will do so via the closest waypoint node to them. There is however a heuristic cost, meaning zombies will attempt different paths via nodes if the closest node to them is not reachable.

![Example map of connected waypoint nodes, arrows indicating that nodes are linked in both directions.](../res/images/example_waypoints.webp)
