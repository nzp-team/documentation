% Dedicated Server - NZ:P Internal Documentation
# Dedicated Server
This page gives a guide for how to set up a dedicated server-only copy for Nazi Zombies: Portable.

If you run [Pterodactyl](https://pterodactyl.io/) there is an [egg](https://github.com/pelican-eggs/games-standalone/tree/main/nazi_zombies_portable) that handles the Binary, Assets, QuakeC, and CVars for you.

## Pre-requisites
### Binary
You will want to obtain the [upstream **NZP-specific** FTEQW **nosdl** binary](https://github.com/nzp-team/fteqw/releases/tag/bleeding-edge) (`nzportable`, `nzportable64`) for your respective platform. You must run this version of NZP with the `-dedicated` argument, and a map (try `+map ndu`).

### Assets
You will need to download the [Assets](https://github.com/nzp-team/assets/releases) and [QuakeC](https://github.com/nzp-team/quakec/releases) files. 

For assets, you will want to download `pc-nzp-assets.zip` and extract it to the same location as the binary, you should have the FTEQW binary (`nzportable`) and a directory called `nzp` beside it. For QuakeC you will want both `fte-nzp-qc.zip` and `standard-nzp-qc.zip` and you will want to extract them inside the `nzp` folder.

When everything is done, your structure should look something similar to this:
```
🗀 pc-nzp-<platform>-nosdl
├ nzportable
├ default.fmf
└ 🗀 nzp
  ├ 🗀 gfx
  [...]
  ├ 🗀 tracks
  ├ default.cfg
  ├ nzportable.cfg
  ├ csprogs.dat
  ├ csprogs.lno
  ├ menu.dat
  ├ qwprogs.dat
  └ progs.dat
```

After that, you can run the binary (with the `-dedicated` argument if not using `nzportable`) and with the below cvars outlined, depending on where you want to host for - Web ([nzp.gay](https://nzp.gay)) or Native:

### Web CVars
#### Defining a Port
You would use the `sv_port_tcp` cvar to specify which port the **WS** server will run on.

#### Protocol Name
`com_protocolname NZP-REBOOT-WEB`

Without this, players will not be able to join your server becuase the client does not know this is specifically an NZP server targetting the web build of NZP.
The dedicated server runs a websocket server, you will need to type explicitly `connect ws://ip:port` into your console on an HTTP (**not S**) page of the web client otherwise the browser will block the connection.

If you want this web server to be accessible via the server browser, you are going to need a TLS-secured connection. We do not handle this. 
You will also need sv_public set. see **Server Publicity** below.


### Desktop/Native CVars
#### Defining a Port
You would use the `sv_port` cvar to specify which port the **UDP** server will run on. The defualt port is `27500`.

#### Protocol Name
`com_protocolname NZP-REBOOT`

Without this, players will not be able to join your server becuase the client does not know this is specifically an NZP server.

### Both versions (Web and Native) CVars

#### Custom Tick Rates
`sv_mintic` is how frequently (in seconds) physics frames are calculated. The default value is 0.045, every 45 milliseconds, it calculates the physics. Be careful with raising this value too high as the more times per second the physics are calculated, the more packets are sent out and can be very bandwidth intensive, this becomes more apparent at higher rounds. With that being said though, 0.045 may be too high/slow and can lead to some physics issues such as zombies getting stuck on the ground/terrain, unable to climb stairs (observed on NDU), etc.

#### Server Publicity
`sv_public` controls how your server is broadcast to the internet. `sv_public 1` is the default and requires you to set up Port Forwarding on your router and system, and broadcasts [to frag-net](https://master.frag-net.com:27950/) via an IP address. `sv_public 2` abuses P2P networking without port-forwarding and broadcasts [to frag-net](https://master.frag-net.com:27950/) via a roomcode (`/123`). NZP uses this on the client for hosting servers. **`sv_public 2` is the easier one to use, and is recommended but may be more unreliable.**



After all of that, when you launch the binary (with `-dedicated` and a map (`+map ndu`)), you should see one of two:
```
Public address reported as XXX:XXX:XXX:XXX:27500
```
```
Publicly listening on /XXX
```
Head to [Frag-Net](https://master.frag-net.com:27950/NZP-REBOOT) ([Web servers go here.](https://master.frag-net.com:27950/NZP-REBOOT-WEB)) If you see your IP/room code there, great! Try joining from the server browser and enjoy your server!

If not everything goes to plan, please see below
---

## Troubleshooting

### `SV_Error: Couldn't load a map. You may need to use the -basedir argument.`
You need to set a map. Add it as an argument: `./nzportable +map ndu`

If you are executing the server in a directory that isnt where the binary is located, you do need to set your basedir to where the binary is located with `-basedir`, e.g `./nzportable64 -dedicated -basedir /home/soldier/my-cool-nzp-zerver/nzp/`

### People can't join (Kicked/Timed out)
There is countless possible reasons as to why people cant join, and as such, we can't simply tell you to do one magic thing. Common fixes are listed below, but they may not work. If they don't, you are simply out of luck, due to how NZP does networking.

>> *something ive mentioned in the past — tl;dr is peer to peer networking without any port forwarding whatsoever is basically abusive and uses a bunch of sneaky tricks and depending on a bunch of different factors it may just flat out not work for you.*
- *Cypress, NZP Developer*

#### sv_public 2
As mentioned before, `sv_public 2` can have reliability issues. If you can, try to use `sv_public 1` and port-forward.

#### \[WEB] Compiling with OpenSSL
If you are on Windows, you **need** to compile FTE with OpenSSL for NZP for Web as the default Windows SSPI uses too old of a standard for FTE (Specifically, Windows has TLS 1.0, we need TLS 1.2). **We recommend you stay away from hosting an NZP web server on Windows** due to this.

#### UNKNOWN type server / Client error about mismatched game type
By an UNKNOWN type server we mean the ones [here, on frag-net](https://master.frag-net.com:27950/game/UNKNOWN).
Mostly this should not be an issue if you are using the standard [upstream **NZP-specific** FTEQW **nosdl** binary](https://github.com/nzp-team/fteqw/releases/tag/bleeding-edge).

Most likely, you forgot to set the `com_protocolname` cvar Otherwise, as frag-net says:
```
These servers have sent a heartbeat but have failed to respond to an appropriate query from a different port. This can happen when:
-   Server is firewalled and all inbound packets are dropped. Try reconfiguring your firewall to allow packets to that process or port.
-   An intermediate router implements an Address/Port-Dependant-Filtering NAT. Try setting up port forwarding.
-   Outgoing connections are asynchronous with regard to port forwarding. Such servers will show with arbitrary ephemerial ports. Docker: you can supposedly work around this with --net=host.
-   Plain and simple packet loss, servers in this state for less than 5 mins may still be fine.
-   Server crashed or was reconfigured before it could respond.
-   MTU limits with failed defragmentation.
-   Routing table misconfiguration.
-   Other.
```

#### Update NZP
Make sure both your server and your players are running the latest version of NZP. NZP can be updated on the client by redownloading from Github Nightly Releases, and on the server by redownloading the [NZP's FTEQW fork](https://github.com/nzp-team/fteqw/releases/tag/bleeding-edge) and all files mentioned in the third paragraph of this page.

#### Your Router is blocking inbound traffic/has a firewall.
Your first choice is to port-forward NZP's port. 

If that doesnt work, `net_ice_servers turn:host:port?username=foo?authorization=bar` allows you to configure proxies for FTE to use which can work around the blocking of traffic. Do note that proxies will add latency. Have a look at [coturn](https://github.com/coturn/coturn) to find out more.

Additionally, make sure UDP and TCP are enabled and not blocked on your router. Also, your network provider may be using CGNAT, which gives multiple customers the same IPv4 address, which will stop you from hosting.

#### MTU issues
You may also be having MTU issues. `net_mtu 1200` can mitigate that.

### People can't join (infinite asset loading)
The NZP-specific FTEQW binary sometimes has this rare issue where you will be stuck on the asset download resource screen with a speed of `???Kb/s`. This can be fixed by downloading the vanilla verson of FTEQW from [fteqw.org](https://www.fteqw.org/).


If you have any other issue not mentioned here, we encourage you to contact the NZ:P team on [Discord](https://discord.gg/3J9rP3xhzT), we *may* be able to help you.
