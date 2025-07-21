% Dedicated Server - NZ:P Internal Documentation
# Dedicated Server
## Binary
You will want to obtain the upstream [FTEQW](https://www.fteqw.org/) **server** binary (`fteqw-sv`, `fteqw-sv64`) for your respective platform. You can also run the standard version of FTEQW with the `-dedicated` argument (`fteqw-sdl2 -dedicated`).

If you run [pterodactyl](https://pterodactyl.io/) there is an [egg](https://github.com/pelican-eggs/games-standalone/tree/main/nazi_zombies_portable) that handles the Binary, Assets, QuakeC, and CVars for you.

Otherwise for everyone else, you will need to download the [Assets](https://github.com/nzp-team/assets/releases) and [QuakeC](https://github.com/nzp-team/quakec/releases) files when using upstream standard FTEQW. For assets, you will want to download `pc-nzp-assets.zip` and extract it to the same location as the binary, you should have the FTEQW binary (`fteqw-sv` or `fteqw-gl`) and a directory called `nzp` beside it. For QuakeC you will want both `fte-nzp-qc.zip` and `standard-nzp-qc.zip` and you will want to extract them inside the `nzp` folder. The NZP folder should now contain some `.dat` files. After that, you can run the binary (with the `-dedicated` argument if not using `fteqw-sv`) and with the below [cvars](https://fte.triptohell.info/wiki/index.php/Console_Variables) outlined. It is recommended to put these into a file called `ftesrv.cfg` inside the `nzp` to auto-execute these on server start.


## Web
### Defining a Port
You would use the `sv_port_tcp` cvar to specify which port the **WS** server will run on.

### Protocol Name
`com_protocolname NZP-REBOOT-WEB`

Without this, players will not be able to join your server becuase the client does not know this is specifically an NZP server.
The dedicated server runs a websocket server, you will need to type explicitly `connect ws://ip:port` into your console on an HTTP (**not S**) page of the web client otherwise the browser will block the connection.


## Desktop/Native
### Defining a Port
You would use the `sv_port` cvar to specify which port the **UDP** server will run on. The defualt port is `27500`.

### Protocol Name
`com_protocolname NZP-REBOOT`

Without this, players will not be able to join your server becuase the client does not know this is specifically an NZP server.

### Custom Tick Rates
`sv_mintic` is how frequently (in seconds) physics frames are calculated. The default value is 0.045, every 45 milliseconds, it calculates the physics. Be careful with raising this value too high as the more times per second the physics are calculated, the more packets are sent out and can be very bandwidth intensive, this becomes more apparent at higher rounds. With that being said though, 0.045 may be too high/slow and can lead to some physics issues such as zombies getting stuck on the ground/terrain, unable to climb stairs (observed on NDU), etc.

### Server Publicity
`sv_public` controls how your server is broadcast to the internet. `sv_public 1` is the default and requires you to set up Port Forwarding on your router and system, and broadcasts [to frag-net](https://master.frag-net.com:27950/) via an IP address. `sv_public 2` abuses P2P networking without port-forwarding and broadcasts [to frag-net](https://master.frag-net.com:27950/) via a roomcode (`/123`). NZP uses this on the client for hosting servers. **`sv_public 2` is the easier one to use, and is recommended but may be more unreliable.**

## Troubleshooting

### `SV_Error: Couldn't load a map. You may need to use the -basedir argument.`
You need to set a map. Include `map ndu` in your `ftesrv.cfg` or add it as an argument: `./fteqw-sv +map ndu`

If you are executing FTEQW in a directory that isnt where the binary is located, you do need to set your basedir to where the binary is located with `-basedir`, e.g `./fteqw-sv -basedir C:/Users/soldier/fteqw/`

### People can't join
There is countless possible reasons as to why people cant join, and as such, we can't simply tell you to do one magic thing. Common fixes are listed below, but they may not work. If they don't, you are simply out of luck, due to how NZP does networking.

> something ive mentioned in the past — tl;dr is peer to peer networking without any port forwarding whatsoever is basically abusive and uses a bunch of sneaky tricks and depending on a bunch of different factors it may just flat out not work for you.
- *Cypress, NZP Developer*

#### Compiling with OpenSSL
If you are on Windows, you **need** to compile FTE with OpenSSL as the default Windows SSPI uses too old of a standard for FTE (Specifically, Windows has TLS 1.0, we need TLS 1.2). This is being worked on by the NZP team. For now, **we recommend you stay away from hosting an NZP server on Windows** due to this.

#### UNKNOWN type server / Client error about mismatched game type
By an UNKNOWN type server we mean the ones [here, on frag-net](https://master.frag-net.com:27950/game/UNKNOWN).

You forgot to set the `com_protocolname` cvar, most likely. Otherwise, as frag-net says:
> These servers have sent a heartbeat but have failed to respond to an appropriate query from a different port. This can happen when:
> -   Server is firewalled and all inbound packets are dropped. Try reconfiguring your firewall to allow packets to that process or port.
> -   An intermediate router implements an Address/Port-Dependant-Filtering NAT. Try setting up port forwarding.
> -   Outgoing connections are asynchronous with regard to port forwarding. Such servers will show with arbitrary ephemerial ports. Docker: you can supposedly work around this with --net=host.
> -   Plain and simple packet loss, servers in this state for less than 5 mins may still be fine.
> -   Server crashed or was reconfigured before it could respond.
> -   MTU limits with failed defragmentation.
> -   Routing table misconfiguration.
> -   Other.

#### Updating NZP
Make sure both your server and your players are running the latest version of NZP. NZP can be updated on the client by redownloading from Github Nightly Releases, and on the server by redownloading the [Assets](https://github.com/nzp-team/assets/releases) (`nzp`) folder

#### Your Router is blocking inbound traffic/has a firewall.
Your first choice is to port-forward NZP's port. 

If that doesnt work, `net_ice_servers turn:host:port?username=foo?authorization=bar` allows you to configure proxies for FTE to use which can work around the blocking of traffic. Do note that proxies will add latency. Have a look at [coturn](https://github.com/coturn/coturn) to find out more.

Additionally, make sure UDP and TCP are enabled and not blocked on your router. Additiocnally, your network provider may be using CGNAT, which gives multiple customers the same IPv4 address. (`XXX.XXX.XXX.XXX`).

You may also be having MTU issues. `net_mtu 1200` can mitigate that.
