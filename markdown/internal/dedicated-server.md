% Dedicated Server - NZ:P Internal Documentation
# Dedicated Server
## Binary
You will want to obtain the upstream [FTEQW](https://www.fteqw.org/) server binary for your respective platform.

If you run pterodactyl there is an [egg](https://github.com/JordanPlayz158/games-standalone/blob/add/nazi-zombies-portable/nazi_zombies_portable/egg-nazi-zombies--portable.json) <!-- Replace with link to official repo once merged --> that handles the Binary, Assets, QuakeC, and CVars for you.

For everyone else, you will need to download the [Assets](https://github.com/nzp-team/assets/releases) and [QuakeC](https://github.com/nzp-team/quakec/releases) files when using upstream FTEQW. For assets, you will want to download `pc-nzp-assets.zip` and extract it to the same location as the binary, you should have the FTEQW binary and a directory called `nzp` beside it. For QuakeC you will want both `fte-nzp-qc.zip` and `standard-nzp-qc.zip` and you will want to extract them inside the `nzp` folder. The NZP folder should now contain some `.dat` files. After that, you can run the binary with the `-dedicated` argument and with the below [cvars](https://fte.triptohell.info/wiki/index.php/Console_Variables) outlined.


## Web
### Defining a Port
You would use the `sv_port_tcp` cvar to specify which port the **WS** server will run on.
### Protocol Name
`NZP-REBOOT-WEB`

The dedicated server runs a websocket server, you will need to type explicitly `connect ws://ip:port` into your console on an HTTP (**not S**) page of the web client otherwise the browser will block the connection.


## Desktop/Native
### Defining a Port
**Request for Clarification**: What protocol does it use over UDP? Based on CVars, I saw the `sv_protocol` accepts ONLY the value CSQC which is Client Side QuakeC but that doesn't make sense for a dedicated server? Does it?


You would use the `sv_port` cvar to specify which port the **UDP** server will run on.
### Protocol Name
`NZP-REBOOT`

### Custom Tick Rates
`sv_mintic` is how frequently (in seconds) physics frames are calculated. The default value is 0.045, every 45 milliseconds, it calculates the physics. Be careful with raising this value too high as the more times per second the physics are calculated, the more packets are sent out and can be very bandwidth intensive, this becomes more apparent at higher rounds. With that being said though, 0.045 may be too high/slow and can lead to some physics issues such as zombies getting stuck on the ground/terrain, unable to climb stairs (observed on NDU), etc.
