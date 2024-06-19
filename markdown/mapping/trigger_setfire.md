% trigger_setfire - NZ:P Mapping Documentation
# trigger_setfire

## Introduction

`trigger_setfire` is a brush-based trigger used to set Clients and/or Enemy AI on fire, if supported by that client or AI type. When the entity collides with the entity, they will be set alight, and continue to be on fire as long as they are in the trigger plus a duration specified in the entity field.

## Features

### Fields

| Field Name | Field ID | Default Value | Description |
|---|---|---|---|
| Effect Duration | `fire_timeout` | `2` | Duration (in seconds) the entity will be on fire after leaving the trigger bounds.

### Spawnflags

| Spawnflag Name | Spawnflag ID | Default Value | Description |
|---|---|---|---|
| Applies to Clients | `1` | `false` | Sets whether or not the `trigger_setfire` trigger impacts Clients (Players) in addition to Enemy AI.
| No Damage to AI/Enemies  | `2` | `false` | Prohibits damage to Enemy AI when enabled, but can still impact Clients.