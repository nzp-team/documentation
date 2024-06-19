% trigger_awardpoints - NZ:P Mapping Documentation
# trigger_awardpoints

## Introduction

`trigger_awardpoints` is a brush-based one-time use trigger used to give a Client a set amount of points. It's most common application is enabling "Spare Change" underneath Perk-A-Cola machines if a Client prones in front of the entity. These cannot be triggered if the Client is in Last Stand.

## Features

### Fields

| Field Name | Field ID | Default Value | Description |
|---|---|---|---|
| Score to Add | `points` | `25` | Amount of score/points gained on trigger.
| Sound to Play on Trigger | `noise` | `sounds/misc/ching.wav` | Sound played when triggered.

### Spawnflags

| Spawnflag Name | Spawnflag ID | Default Value | Description |
|---|---|---|---|
| Requires Client to Stand | `1` | `false` | Prevents trigger from firing unless the Client is Standing.
| Requires Client to Crouch | `2` | `false` | Prevents trigger from firing unless the Client is Crouching.
| Requires Client to Prone | `4` | `false` | Prevents trigger from firing unless the Client is Prone.
| Affected by Double Points Power-Up  | `8` | `false` | Toggle affectedness by the Double Points score multiplier.