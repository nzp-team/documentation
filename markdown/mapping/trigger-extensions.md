% Trigger and Target Extensions - NZ:P Mapping Documentation
# Trigger and Target Extensions

## Introduction

_Nazi Zombies: Portable_ contains several extensions and changes on top of Quake/Half-Life triggers to cater to the co-operative nature of the game and it's feature set.

## Changes

### `message` Key

When an entity is _used_, the `message` will be presented to all clients alive, as opposed to the client who was responsible for the target firing.

## Extensions

### Multi-Targets

Entities can target multiple entities different `targetname`s. There can be up to 8, the additional 7 being activated via `target2` - `target8`. Standard functionality of activating multiple entities with the same `targetname` is still supported on top of this.

### Round-based Delays

Introduced via the `round_delay` key, upon firing a target you can insert a Round-based delay before it is activated. This takes presidence over `delay`.