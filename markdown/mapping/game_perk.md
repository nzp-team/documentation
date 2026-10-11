% game_perk - NZ:P Mapping Documentation
# game_perk

## Introduction

`game_perk` is a point entity used to give Clients Perk-A-Colas.

## Features

### Fields

| Field Name | Field ID | Default Value | Description |
|---|---|---|---|
| Perk Selection Mode | `mode` | `0` | Perks to give on activation (`0` for one random Perk, `1` for all selected Perks).
| Client Selection Mode | `player_mode` | `0` | Clients to give Perks to (`0` for the Client who activated the entity, `1` for all Clients).

### Spawnflags

Each `spawnflag` selects a Perk that `game_perk` can give:

| Spawnflag Name | Spawnflag ID | Default Value | Description |
|---|---|---|---|
| Jugger-Nog | `1` | `false` | Includes Jugger-Nog in the Perk selection.
| Double Tap Root Beer | `2` | `false` | Includes Double Tap Root Beer in the Perk selection.
| Speed Cola | `4` | `false` | Includes Speed Cola in the Perk selection.
| Quick Revive | `8` | `false` | Includes Quick Revive in the Perk selection.
| PhD Flopper | `16` | `false` | Includes PhD Flopper in the Perk selection.
| Stamin-Up | `32` | `false` | Includes Stamin-Up in the Perk selection.
| Deadshot Daiquiri | `64` | `false` | Includes Deadshot Daiquiri in the Perk selection.
| Mule Kick | `128` | `false` | Includes Mule Kick in the Perk selection.

At least one Perk must be selected, or the Entity will `objerror`.