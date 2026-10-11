% spawn_pu - NZ:P Mapping Documentation
# spawn_pu

## Introduction

`spawn_pu` is a point entity that spawns a Power-Up whenever its `targetname` is triggered. The entity remains available for subsequent activations, including after a Power-Up is collected or expires. Each activation creates a separate Power-Up.

## Fields

| Field Name | Field ID | Default Value | Description |
|---|---|---|---|
| Power-Up | `spawn_id` | `0` | Power-Up ID to spawn, or `-1` to select from the random rotation. |

| Power-Up ID | Power-Up |
|---|---|
| `-1` | Random |
| `0` | Nuke |
| `1` | Insta-Kill |
| `2` | Double Points |
| `3` | Carpenter |
| `4` | Max Ammo |
| `5` | Free Perk |
| `6` | Weapon Upgrade |
| `7` | Bonus Points |

Random selection follows the current Power-Up rotation and may produce no drop if no Power-Up is eligible.

## Spawnflags

| Spawnflag Name | Spawnflag ID | Default Value | Description |
|---|---|---|---|
| Spawn on Player | `1` | `false` | Spawn at the first player entity found instead of this entity's origin. |
