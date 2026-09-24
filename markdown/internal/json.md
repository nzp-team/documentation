% JSON Data-Driving - NZ:P Internal Documentation
# JSON Data-Driving

## Introduction

_Nazi Zombies: Portable_ allows users and map makers to define gameplay behavior and HUD assets through `.json` files. Map authors can ship settings for one level, while users can select an overlay that applies to every map they play.

You do not need to copy the whole default configuration into a map or overlay file. Any omitted field keeps the value supplied by the previous file.

Both `// line comments` and `/* block comments */` are accepted. Duplicate keys, values of the wrong type, and values outside the listed ranges cause the entire file to be rejected. A rejected map or overlay file leaves the settings from the previous layer alone.

## Load Order

`data/configuration/default.json` defines the base set of _NZ:P_ gameplay behaviors and is shipped with the game. It is always loaded first and **should not be altered or overwritten by mods or usermaps**.

After `default.json`, _NZ:P_ attempts to load a map-specific JSON file from `data/configuration/maps/<mapname>.json`. This should be used by usermap authors who want settings tied to their own level.

Lastly, _NZ:P_ attempts to load an overlay from `data/configuration/overlays/<overlay>.json`, where `<overlay>` is the value of the `sv_gameconfig` cvar. The cvar takes a filename without a path or `.json` extension.

The resulting order is:

1. `data/configuration/default.json`
2. `data/configuration/maps/<mapname>.json`
3. `data/configuration/overlays/<overlay>.json`

Later files replace values from earlier files. Arrays are replaced as a whole. If a map defines two zombie attack sounds, for example, it will use those two sounds instead of keeping the remaining sounds from `default.json`.

## JSON Specification

The values listed as defaults below are the values supplied by `default.json`.

## `gameplay`

### `global`

* `all_items_cost_multiplier` (number, default `1`): Multiplies the price of purchasable items, including doors, wall weapons, traps, teleporters, Perk-A-Colas, and Pack-A-Punch. A value of `1.5` makes a 1000 point purchase cost 1500 points.

### `perksacola`

* `perk_purchase_limit` (number from `0` to `8`, default `8`): Defines how many perks a player may hold before Perk-A-Cola machines stop accepting purchases. Perks awarded by a Power-Up count toward the total.

* `perk_quickrevive_health_regeneration_multiplier` (number greater than `0`, default `1`): Divides the delay before health regeneration begins while the player has Quick Revive. Higher values shorten the delay.

* `perk_juggernog_player_health` (number greater than `0`, default `160`): Defines the player's maximum health while they have Jugger-Nog.

* `perk_speedcola_accelerates_barricade_repair` (boolean, default `true`): If `true`, Speed Cola makes the player repair barricades faster.

* `perk_speedcola_reload_speed_multiplier` (number greater than `0`, default `2`): Divides weapon reload time while the player has Speed Cola. Higher values produce faster reloads.

* `perk_doubletap_rate_of_fire_multiplier` (number greater than `0`, default `1.298`): Divides the delay between shots while the player has Double Tap Root Beer.

* `perk_doubletap_rechamber_speed_multiplier` (number greater than `0`, default `1.5`): Divides rechamber time for weapons such as bolt-action rifles while the player has Double Tap Root Beer.

* `perk_staminup_movement_speed_multiplier` (number, default `1.07`): Multiplies movement speed while the player has Stamin-Up.

* `perk_staminup_stamina_recharge_multiplier` (number greater than `0`, default `2`): Multiplies the maximum sprint duration while the player has Stamin-Up.

* `perk_deadshot_headshot_damage_multiplier` (number, default `1`): Multiplies headshot damage while the player has Deadshot Daiquiri.

* `perk_deadshot_weapon_spread_reduction_multiplier` (number, default `0.65`): Multiplies weapon spread while the player has Deadshot Daiquiri. Lower values produce tighter spread.

### `packapunch`

* `packapunch_supports_upgrade_tiers` (boolean, default `false`): If `true`, an already upgraded weapon can be placed back into Pack-A-Punch for another tier, up to tier three. This mimics _Black Ops: Cold War_.

* `packapunch_upgrades_instantly` (boolean, default `false`): If `true`, Pack-A-Punch replaces the held weapon immediately instead of placing it inside the machine for collection. This mimics _Black Ops: Cold War_.

### `powerups`

* `max_powerups_per_round` (number from `0` to `64`, default `4`): Defines how many random Power-Ups may drop during one round. Forced drops are excluded from this limit.

* `powerup_spawn_frequency_multiplier` (number, default `1`): Multiplies the random Power-Up drop chance. The base chance is `0.02` on Normal and `0.04` on Easy. Hard and Nightmare do not produce random drops.

#### `sounds`

* `pick_up` (string, default `sounds/pu/pickup.wav`): Sound played when a player collects a Power-Up.

* `idle` (string, default `sounds/pu/powerup.wav`): Sound emitted by a Power-Up while it waits to be collected.

* `drop` (string, default `sounds/pu/drop.wav`): Sound played when a Power-Up drops.

#### Options shared by every Power-Up

The objects `powerup_max_ammo`, `powerup_instakill`, `powerup_double_points`, `powerup_carpenter`, `powerup_nuke`, `powerup_free_perk`, `powerup_bonus_points`, and `powerup_weapon_upgrade` share the following fields:

* `enabled` (boolean): Controls whether the Power-Up may enter the random drop rotation. Forced drops can still spawn a disabled Power-Up.

* `chance_to_allow_in_rotation` (number from `0` to `1`): Defines the chance that the Power-Up is admitted when the game builds the current drop rotation. `0` never admits it and `1` always admits it, provided its other requirements pass.

* `disabled_before_round` (number): Keeps the Power-Up out of the random rotation while the current round is lower than this value.

* `toast` (string): Text displayed when the Power-Up is collected and `show_toast` is enabled.

* `show_toast` (boolean): Controls whether `toast` is shown when the Power-Up is collected.

* `model` (string): Model used for the dropped Power-Up.

* `voiceover` (string): Voice line played when the Power-Up is collected. An empty string disables the voice line.

The shared defaults for each Power-Up are:

| Object | `enabled` | `chance_to_allow_in_rotation` | `disabled_before_round` | `toast` | `show_toast` | `model` | `voiceover` |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `powerup_max_ammo` | `true` | `1` | `0` | `Max Ammo!` | `true` | `models/pu/maxammo!.mdl` | `sounds/pu/maxammo.wav` |
| `powerup_instakill` | `true` | `1` | `0` | `Insta-Kill!` | `false` | `models/pu/instakill!.mdl` | `sounds/pu/insta_kill.wav` |
| `powerup_double_points` | `true` | `1` | `0` | `Double Points!` | `false` | `models/pu/x2!.mdl` | `sounds/pu/double_points.wav` |
| `powerup_carpenter` | `true` | `1` | `0` | `Carpenter!` | `false` | `models/pu/carpenter!.mdl` | `sounds/pu/carpenter.wav` |
| `powerup_nuke` | `true` | `1` | `0` | `Ka-Boom!` | `false` | `models/pu/nuke!.mdl` | `sounds/pu/kaboom.wav` |
| `powerup_free_perk` | `false` | `0.25` | `15` | `Random Perk!` | `false` | `models/pu/perkbottle!.mdl` | `""` |
| `powerup_bonus_points` | `false` | `1` | `0` | `Bonus Points!` | `false` | `models/pu/points!.mdl` | `""` |
| `powerup_weapon_upgrade` | `false` | `1` | `0` | `Weapon Upgrade!` | `false` | `models/pu/pack!.mdl` | `""` |

#### `powerup_max_ammo`

Max Ammo is enabled by default. Its rotation chance is `1`, and it is available from the start of the game.

* `fills_magazine` (boolean, default `false`): If `true`, Max Ammo fills weapon magazines in addition to reserve ammunition, grenades, and Bouncing Betties.

#### `powerup_instakill`

Insta-Kill is enabled by default. Its rotation chance is `1`, and it is available from the start of the game.

* `duration` (number, default `30`): Defines how many seconds Insta-Kill remains active.

#### `powerup_double_points`

Double Points is enabled by default. Its rotation chance is `1`, and it is available from the start of the game.

* `duration` (number, default `30`): Defines how many seconds Double Points remains active.

* `score_multiplier` (number, default `2`): Multiplies score changes which are marked as affected by Double Points.

#### `powerup_carpenter`

Carpenter is enabled by default. Its rotation chance is `1`, and it is available from the start of the game.

* `destroyed_barricade_requirement` (number, default `5`): Defines how many damaged barricades must exist before Carpenter may enter the rotation.

* `score_awarded` (number, default `200`): Score awarded to every player after Carpenter finishes repairing the map. Negative values remove score without taking a player below zero.

#### `powerup_nuke`

Nuke is enabled by default. Its rotation chance is `1`, and it is available from the start of the game.

* `score_awarded` (number, default `400`): Score awarded to every player when the Nuke finishes killing the current group of zombies. Negative values remove score without taking a player below zero.

* `explosion_sfx` (string, default `sounds/pu/nuke.wav`): Explosion sound played when the Nuke takes effect.

#### `powerup_free_perk`

Free Perk is disabled by default. Its default rotation chance is `0.25`, and it is unavailable before round `15`.

* `awarded_score_if_no_perk_obtained` (number, default `0`): Score awarded to a player if none of the allowed perks can be given to them. Negative values remove score without taking the player below zero.

* `allowed_perksacola` (array of up to eight strings): Defines which perks the Power-Up may award. Accepted values are `quickrevive`, `juggernog`, `speedcola`, `doubletap`, `phdflopper`, `staminup`, `deadshot`, and `mulekick`.

#### `powerup_bonus_points`

Bonus Points is disabled by default. Its rotation chance is `1`, and it is available from the start of the game.

* `score_awarded` (number, default `500`): Score awarded to every player. Negative values remove score without taking a player below zero.

#### `powerup_weapon_upgrade`

Weapon Upgrade is disabled by default. Its rotation chance is `1`, and it is available from the start of the game.

* `awarded_score_if_no_upgrade_received` (number, default `0`): Score awarded to a player whose held weapon cannot be upgraded. If Pack-A-Punch tiers are enabled, an upgraded weapon remains eligible until it reaches tier three. Negative values remove score without taking the player below zero.

### `ai`

* `score_system` (string, default `default`): Defines how score is earned from damaging and killing AI. Accepted values are `default`, `cw`, and `bo4`.

  * `default` awards 10 points for a non-lethal hit. Kills award an amount based on the final damage type, including 100 points for a headshot and 130 for a melee kill.
  * `cw` removes hit points and awards 115 points for a headshot or melee kill and 90 points for other kills.
  * `bo4` awards 10 points each time damage crosses another 10 percent of a zombie's maximum health, up to 90 points per zombie. A headshot final blow adds 30 points, while a melee final blow adds 60.

* `round_health_cap` (number, default `0`): Stops zombie health scaling after the given round. `55` makes round 56 and later use round 55 health. `0` disables the cap.

#### `zombie.walk_styles`

These booleans define which movement animations zombies may use. At least one must be `true`. If the preferred style is disabled, the zombie chooses the closest permitted style. Super sprint moves at 210 units per second.

* `can_walk` (boolean, default `true`): Allows walking animations.

* `can_jog` (boolean, default `true`): Allows the jogging animation.

* `can_sprint` (boolean, default `true`): Allows the sprinting animation.

* `can_super_sprint` (boolean, default `false`): Allows the faster _Verrückt_ sprint.

#### `zombie.sounds`

Each field is an array containing up to 12 sound paths. One sound is selected at random when the corresponding event occurs. Empty entries are rejected, so remove an unwanted entry instead of leaving an empty string in the middle of the array.

* `attack`: Sounds used when a zombie attacks.

* `death`: Sounds used when a zombie dies.

* `shout`: Sounds used for loud zombie vocalizations.

* `taunt`: Sounds used for zombie taunts.

* `groan`: Idle groans used while a zombie moves through the map.

### `player`

* `start_health` (number greater than `0`, default `100`): Defines player health before Jugger-Nog is acquired.

* `can_earn_points_in_last_stand` (boolean, default `false`): If `true`, downed players may earn positive score. Score cannot be removed from a downed player regardless of this setting.

* `can_use_melee` (boolean, default `true`): Controls the melee action. Dedicated melee weapons (Ballistic Knife) remain usable.

* `can_use_equipment` (boolean, default `true`): Controls grenades and Bouncing Betties.

* `can_earn_score_from_sources_other_than_ai` (boolean, default `true`): Controls score from barricade repairs, score triggers, Carpenter, Nuke, and other sources outside direct AI damage.

#### `health_regeneration`

* `regeneration_multiplier` (number, default `1`): Multiplies the rate at which player health regenerates. `0` disables regeneration without disabling its delay timers.

* `regeneration_delay_light_damage` (number, default `2.4`): Seconds before regeneration begins when the player remains above 20 percent health.

* `regeneration_delay_heavy_damage` (number, default `5`): Seconds before regeneration begins when the player falls to 20 percent health or lower.

### `rounds`

* `delay_between_rounds` (number, default `10`): Defines the number of seconds between the end of one round and the start of the next.

* `ai_spawn_delay_reduction_multiplier` (number, default `1`): Controls how quickly the zombie spawn delay decreases as rounds increase. Each applicable step removes five percent multiplied by this value, with the result clamped so the delay cannot become negative.

#### `sounds`

* `game_start` (string, default `sounds/rounds/splash1.wav`): Sound played during the initial map introduction.

* `new_round` (string or array of up to four strings, default `sounds/rounds/nround1.wav`): Sound played when a normal round begins. If an array is supplied, one entry is selected at random.

* `end_round` (string or array of up to four strings, default `sounds/rounds/eround1.wav`): Sound played when a normal round ends. If an array is supplied, one entry is selected at random.

* `new_hound_round` (string, default `sounds/rounds/droundstart.wav`): Sound played when a Hellhound round begins.

* `end_hound_round` (string, default `sounds/rounds/droundend.wav`): Sound played when a Hellhound round ends.

* `hound_round_taunts` (string or array of up to four strings, default `sounds/rounds/fetch.wav`): Voice line played five seconds after a Hellhound round begins. If an array is supplied, one entry is selected at random.

* `game_over` (string, default `sounds/music/end.wav`): Sound played when the game ends.

## `interface`

Interface asset paths omit the file extension, path strings are limited to 63 characters.

### `perksacola`

* `position_style` (string, default `nzp`): Defines the perk icon layout. Accepted values are `nzp`, `cw`, `waw`, and `bo3`. An unrecognized value uses the `nzp` layout.
    * `nzp`: Default positioning (top left, cascading with overlap).
    * `cw`: _Black Ops: Cold War_, icons are drawn from bottom center.
    * `waw`: _World at War_, icons are drawn on left side above round indicator.
    * `bo3`: _Black Ops III_, icons are drawn on left side to the right of round indicator.

#### `graphics`

Each field defines the HUD image used for that perk:

* `quickrevive` 
* `juggernog`
* `speedcola`
* `doubletap` (Double Tap Root Beer icon used when the damage-buff version is inactive).
* `doubletap_2` (Double Tap Root Beer icon used when its damage buff is active).
* `staminup`
* `flopper`
* `deadshot`
* `mulekick`

### `powerups.graphics`

* `insta_kill`: HUD icon displayed while Insta-Kill is active.

* `double_points`: HUD icon displayed while Double Points is active.

### `rounds`

* `position_style` (string, default `bottom_left`): Defines where the round counter rests. Accepted values are `bottom_left` and `top_right`.

* `skip_intro` (boolean, default `false`): If `true`, the round counter is drawn at its final position immediately. This skips the centered icon, the moving animation, and the introductory `Round` text.

* `use_tally_marks_until_round` (number, default `11`): Defines the first round displayed with numeric graphics. With the default value, rounds 1 through 10 use tally marks and round 11 uses numeric digits.

* `color` (array of three numbers from `0` to `255`, default `[107, 1, 0]`): RGB color applied to the round counter. The introductory `Round` text uses a brighter version of the same color to account for the darker charset.

#### `graphics`

* `tally_marks` (array of up to five strings): Images used for one through five tally marks, in order.

* `numeric` (array of up to ten strings): Images used for digits zero through nine, in order.

### `equipment.graphics`

* `grenade`: HUD icon used for grenades.

* `bouncing_betty`: HUD icon used for Bouncing Betties.

### `score`

* `position_style` (string, default `left`): Defines which side of the screen holds the player score display. `right` places it on the right; any other value uses the left.

#### `graphics`

* `score_background_full` (string, default `gfx/hud/moneyback`): Score background used for the local player.

* `score_background_condensed` (string, default `gfx/hud/moneyback_condensed`): Smaller score background used for other players in a cooperative game.
