% NZ:P Toolbox - NZ:P Mapping Documentation
# NZ:P Toolbox

## Introduction

NZ:P Toolbox (_Toolbox_ for short) is a small software suite of glue code used by the _NZ:P Team_ and [available to users on GitHub](https://github.com/nzp-team/toolbox). It is designed to handle environment set up for various NZ:P utilities for you via [Docker](https://www.docker.com). Toolbox is in active development and supported functions will grow over time.

## Installation

Please see the [README](https://github.com/nzp-team/toolbox/blob/main/README.md) for NZ:P Toolbox for installation and usage instructions.

## Feature Breakdown

Please see the [README](https://github.com/nzp-team/toolbox/blob/main/README.md) for a comprehensive list of supported commands, below are details on commands that need greater elaboration.

### Map Compilation

Toolbox can compile maps using the `build-map` command. By default, Toolbox will compile all maps in `source/maps/` `assets` source, to compile a specific map, you can use `--map map-name` as an argument. Toolbox will default to a fast compile, for "full" (release-ready) compilation, add `--full` to the invocation.

Map makers are still given the ability to have direct control over compilation arguments, via `.arg` files that should exist in the same path as the `.map`, where you can directly interface with VHLT. Take this example from _Nacht der Untoten_:

```
hlbsp_args=""
hlcsg_args=""
hlvis_args="-maxdistance 750"
hlrad_args=""
```

Argument files will be used automatically if they exist, no extra parameter is needed.

Maps will be moved to `common/maps/` in `assets` if compilation was successful.

### WAD Compilation

Toolbox will compile map textures in `source/textures/wad/` in `assets` via the `build-wad` command. Each directory represents the name of the WAD, where you can drop most supported image formats (though PNG is preferred) into the directory and a WAD will be built in `source/textures/wad` for you to use in TrenchBroom.