% Wall Weapons - NZ:P Mapping Documentation
# Wall Weapons

__NOTE: This guide uses the terms "level" and "map" interchangeably.__

## Introduction

Nazi Zombies: Portable features purchaseable weapons off-the-wall in the same vein as _Call of Duty_. This is done via two different entities -- a `buy_weapon` brush-trigger that is your purchaseable weapon prompt, and an optional `weapon_wall` visual entity that serves as the chalk drawing design on the wall.

## Purchaseable Weapons (`buy_weapon`)

![Example of a `buy_weapon` entity properly set up.](../res/images/wall_wep_trigger_flags.webp)

`buy_weapon` triggers have three important fields. The weapon you wish to be purchaseable (`weapon`), the cost of the weapon (`cost`), and the cost of ammunition after initial weapon purchase (`cost2`).

### _Call of Duty_'s Defined Weapon Costs

_Call of Duty: World at War_ and _Call of Duty: Black Ops_ use consistent prices for their off-the-wall weapons in game. These prices, sorted from highest to lowest, are as follows (any weapon not listed here is a weapon not available off-the-wall in an official capacity):

- Bowie Knife: `3000` points
- Scoped Kar98k†: `1500` points
- M1897 Trench Gun: `1500` points
- FG42: `1500` points
- BAR††: `1400` points
- Thompson: `1200` points
- Sawed-Off Shotgun: `1200` points
- Double-Barreled Shotgun: `1200` points
- STG-44: `1200` points
- Bouncing Betty: `1000` points
- MP40: `1000` points
- Type 100: `1000` points
- MP5K: `1000` points
- Gewehr 43: `600` points
- M1A1 Carbine: `600` points
- M1 Garand: `600` points
- Stielhandgrenate: `250` points (ammo only)
- Springfield: `200` points
- Kar98k: `200` points

All weapons available off the wall have an ammunition cost that is 50% of the full weapon cost.

†Via the _Nacht der Untoten_ cabinet secret.
††The BAR has a variant with an unusable (cut feature) bipod in _Verrückt_ that cost 2500 points. This has been disregarded due to it's nature.

### Universal Ammo/Weapon Crate

Using field `99` for the `weapon` key, level creators can opt for a less traditional weapon buy station as opposed to an off-the-wall grab. These stations replenish ammo for the weapon currently held by the client, as a fixed amount. This could be useful for ammunution replenishment for a weapon only available via the _Mystery Box_, as an example.

## Weapon Chalk

![An example of a properly established `buy_weapon` and `weapon_wall` link](../res/images/wall_wep_chalk_link.webp)

`weapon_wall` entities strictly serve as an optional visual aid for purchaseable triggers. They can be `target`ed by `buy_weapon`, and doing so will cause them to trigger their weapon summon to occupy the chalk's space. It is worth noting that `weapon_wall` has a separate `weapon` field, so using an incorrect field will cause the wrong chalk and world model to appear. 
