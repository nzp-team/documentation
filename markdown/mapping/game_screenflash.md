% game_screenflash - NZ:P Mapping Documentation
# game_screenflash

## Introduction

`game_screenflash` is a point entity used to flash all Client's screens for a specified amount of time, useful for cinematic events.

## Features

### Fields

| Field Name | Field ID | Default Value | Description |
|---|---|---|---|
| Sound to Play on Trigger | `noise` | `""` | Sound played during the screen flash.
| Screen Flash Color | `weapon` | `0` | Color to flash the screen (`0` for white, `1` for black).
| Flash Duration | `ltime` | `2` | Amount of seconds the flash lasts, including fade in and fade out.
| Round Delay | `currentammo` | `10` | Delay before next round starts (if spawnflag `1` is set).

### Spawnflags

| Spawnflag Name | Spawnflag ID | Default Value | Description |
|---|---|---|---|
| End Current Round | `1` | `false` | Whether the screen flash should end the current Round.