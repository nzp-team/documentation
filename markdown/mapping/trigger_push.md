% trigger_push - NZ:P Mapping Documentation
# trigger_push

## Introduction

`trigger_push` is an invisible brush-based trigger that pushes Players and/or movable Non-Player entities in a specified direction. Enable the corresponding spawnflags to select which entities it affects; neither group is enabled by default. Non-Players include Enemy AI and movable objects such as grenades. Static brushes, attached models, non-solid entities, and entities using noclip are not affected.

By default, the brush acts as a continuous wind or conveyor field. Entities overlapping the brush are moved at the specified speed, with collision against the world and other solid entities. This movement is separate from their own velocity, so the push does not accumulate into an increasingly fast impulse. Entities can move with or against the field when their velocity is retained. The field stops moving them when they leave its bounds or it is disabled.

With **Once Only**, the brush instead adds a single velocity impulse to the first eligible entity that touches it, then removes itself.

## Features

### Fields

| Field Name | Field ID | Default Value | Description |
|---|---|---|---|
| Name | `targetname` | | Name used by other entities to enable, disable, or toggle this trigger. It can also be removed via `killtarget`.
| Angle | `angle` | `0` | Push direction in degrees. `0` pushes along positive X. Use `-1` to push up or `-2` to push down. The `angles` field can also specify pitch, yaw, and roll.
| Speed of push | `speed` | `100` | Push speed in map units per second. With Once Only, this is the velocity added by the impulse.
| Velocity retained (%) | `velocity_retention` | `0` | Percentage of the entity's own velocity to retain before pushing, clamped to `0`–`100`. `0` stops its existing velocity, `50` halves it, and `100` preserves it. Continuous fields apply this each server frame; Once Only applies it once before adding the impulse.

### Spawnflags

| Spawnflag Name | Spawnflag ID | Default Value | Description |
|---|---|---|---|
| Once Only | `1` | `false` | Applies one velocity impulse to the first eligible entity, then removes the trigger.
| Affects Players | `2` | `false` | Enables pushing Players.
| Affects Non-Players | `4` | `false` | Enables pushing movable Non-Player entities, including Enemy AI.
| Start disabled | `8` | `false` | Disables the trigger until enabled via target.

The trigger supports the standard [Trigger State](trigger-extensions.md) values: On enables it, Off disables it, and Toggle switches its current state.
