% Zombie Horde Points - NZ:P Mapping Documentation
# Zombie Horde Points

## Introduction

Given situations where all players in a server are in Last Stand or are otherwise unreachable, Zombies in Nazi Zombies: Portable will "horde" at the nearest possible location available. This is done via the `zombie_horde_point` entity.

## Usage

Zombies will automatically locate the closest `zombie_horde_point` entity in the level and run towards it. All a level creator is required to do is place one or more of them around their level. It is recommended to place these in locations that are not obtrusive to the player -- meaning they are not blocking accessibility to important areas in the level, and are not in places that are generally common for the player to enter Last Stand in.

## Backwards Compatibility

In the event a level lacks any `zombie_horde_point` entities, Nazi Zombies: Portable will locate them to the initial Player 1 spawn point (see [Player Spawn Points](player-spawns.md) for more information) to "horde" instead.