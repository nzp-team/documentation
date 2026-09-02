% game_random - NZ:P Mapping Documentation
# game_random

## Introduction

`game_random` is a point entity used to randomly activate another entity in a list. Where `N` is a max number defined by the user, it will generate a number from 1-`N`. It will then execute targetnames specified by it's `name` key with the suffix `_N`.

For example, if you had eight `perk_activate` triggers, each with the `targetname` `perk_activiate_1`, `perk_activiate_2`, _..._, one of those eight can be randomly executed by `game_random`.

## Features

### Fields

| Field Name | Field ID | Default Value | Description |
|---|---|---|---|
| Entity targetnames | `name` | `""` | Targetname prefix for selectable random targets.
| Max number | `health` | `10` | Maximum number to generate, inclusive.