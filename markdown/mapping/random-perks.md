% Random Perk-A-Cola Machines - NZ:P Mapping Documentation
# Random Perk-A-Cola Machines

__NOTE: This guide uses the terms "level" and "map" interchangeably.__

## Introduction

Nazi Zombies: Portable features the ability, via built-in entities, to _'randomize'_ the positions or types of Perk-A-Cola machines that can appear in a user's level. This is done via the `perk_random` entity. The behavior of this entity is contextual, which will be gone over on this page.

## Features

### Choosing A Perk-A-Cola Selection

![A `perk_random` Entity in the wild.](../res/images/perk_random.webp)

Control over `perk_random` is done entirely via its `spawnflags`. Each `spawnflag` corresponds to an individual Perk-A-Cola machine:

| Spawnflag Value | Perk-A-Cola Equivalent |
|---|---|
| `1` | Quick Revive |
| `2` | Jugger-Nog |
| `4` | Speed Cola |
| `8` | Double Tap Root Beer |
| `16` | PhD Flopper |
| `32` | Stamin-Up |
| `64` | Deadshot Daiquiri |
| `128` | Mule Kick |

If no `spawnflags` are selected, the Entity will [`objerror`](https://web.archive.org/web/20240212193953/https://quakewiki.org/wiki/objerror).

There will be 64 attempts total to spawn a Perk-A-Cola given the specified `spawnflags`. An [`objerror`](https://web.archive.org/web/20240212193953/https://quakewiki.org/wiki/objerror) will be thrown reporting total failure if it can not accomplish this.

### Using Extended Perk-A-Cola Abilities

![If Deadshot Daiquiri is selected by `perk_random`, the existing Machine will teleport from behind the wall in the desired location.](../res/images/perk_random_repositioning.webp)

By default, `perk_random` behaves by Spawning the desired Perk-A-Cola entity out-right, using the default ("legacy") values provided for Map Backwards Compatibility. This can be problematic, however, if you would like to utilize the additional feature set provided by placing individual `perk_*` entities.

This can be achieved via `perk_random` by individually placing (preferably out-of-bounds) the Perk-A-Cola machines you desire to be placed by randomization. If the selected Perk-A-Cola is discovered, instead of spawning a new machine out-right, `perk_random` will opt to instead move the Perk-A-Cola machine in it's place. 