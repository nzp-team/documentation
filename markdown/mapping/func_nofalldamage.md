% func_nofalldamage - NZ:P Mapping Documentation
# func_nofalldamage

## Introduction

`func_nofalldamage` is an invisible, non-solid brush entity that prevents player fall damage when the center of the player's feet is inside its bounds at landing. It applies to all players independently.

Passing through the volume while falling does not grant protection at a different landing location. Fall tracking resets after a protected landing, so a subsequent fall outside the volume causes normal damage. Landing sounds, PhD Flopper explosions, etc. keep their normal behavior.