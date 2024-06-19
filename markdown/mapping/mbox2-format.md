% Customizing Mystery Box Weapons - NZ:P Mapping Documentation
# Customizing Mystery Box Weapons

## Introduction

Nazi Zombies: Portable gives level creators the ability to customize what weapons exist in the Mystery Box. They have full-range of every non-Pack-A-Punch variant in the game. This is done via the `MBOX2` file format.

`MBOX2` files are created by the creator, placed in `nzp/maps/` with the name `mapname.mb2`, substituting `mapname` with the same file name as the level `.BSP`.

Here is an example file that simply disables the Ray Gun and Wunderwaffe DG-2 from appearing in the Mystery Box:

```
nzp_mbox2

deny:
    ray_gun
    wunderwaffe
```

## File Header

All `MBOX2` files must begin with the string "`nzp_mbox2`". This is done to ensure validity of the file. Nazi Zombies: Portable will not allow a level to load if it contains an `MBOX2` file that does not meet this requirement, and report the issue to the developer console.

## Allow vs. Deny

`MBOX2` has two modes: "`allow`" and "`deny`". Provided the `allow` command, all weapons listed will appear in the Mystery Box, and those not listed will automatically be excluded. Similarly when `deny` is used, all weapons will be included aside from the entries listed.

`MBOX2` only supports one command, it is recommended to use the command that has the shortest number of entries to decrease loading time for low powered platforms.

## Weapon Names

Eligible weapon names are provided via the [Weapon IDs](../internal/weapon-ids.md) documentation entry. If a weapon is listed that is not recognized by the game, the level will not be allowed to load, and the problematic weapon will be reported to the developer console.

## Backwards Compatibility

Nazi Zombies: Portable previously primarily utilized the `MBOX` 1.0 format, which was a string-binary list of hard-coded weapon order status. This format is still supported internally, meaning levels that previously utilized it will still function as intended. Additionally, while not recommended, it can still be utilized for new content. It uses the `.mbox` file extension.

### Format Example
The following is an example `MBOX` 1.0 file contents:

```
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
1
0
1
1
1
1
1
1
```

### Weapon Order

`MBOX` 1.0 files used a hard coded weapon order, that differs from the standard internal [Weapon IDs](../internal/weapon-ids.md) used by Nazi Zombies: Portable. The `MBOX` 1.0-exclusive listing follows:

- Colt M1911
- Kar98k
- Double-Barreled Shotgun
- MG42
- Ray Gun
- Thompson
- M2 Flamethrower
- PPSh-41
- Sawed-Off Shotgun
- Wunderwaffe DG-2
- M1A1 Carbine
- Gewehr
- FG42
- M1919 Browning
- Scoped Kar98k
- .357 Magnum
- STG-44
- Panzerschreck
- Ballistic Knife
- PTRS-41
- MP40
- M1897 Trench Gun
- BAR
- M1 Garand
- Type 100
- MP5K
- Springfield