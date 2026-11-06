% trigger_interact - NZ:P Mapping Documentation
# trigger_interact

## Introduction

`trigger_interact` is a brush-based trigger used to fire targets when a Client in its collision box presses their Interact button. There is no Use String provided, making it optimal for "secrets".

Firing a trigger at an already used `trigger_interact` will reset it, allowing it to be interacted with again.


## Features

### Fields

| Field Name | Field ID | Default Value | Description |
|---|---|---|---|
| Field Name | Field ID | Default Value | Description |
| Cost | `cost` | | Point cost for interacting with the trigger.
| Usage String | `useprint_string_1` | | Custom usage string shown to the player when in range. `%b` will insert the use key icon per platform into the string. Example usage: `Hold %b to Activate Subroutine.`

### Spawnflags

| Spawnflag Name | Spawnflag ID | Default Value | Description |
|---|---|---|---|
| Inactive until Triggered | `1` | `false` | Sets whether the `trigger_interact` should be disabled until activated via target.
