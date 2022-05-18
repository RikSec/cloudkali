[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)
<a href="https://www.buymeacoffee.com/nrikas" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>

# Kali Linux Terminal over the web ![backend](https://github.com/tsl0922/ttyd/workflows/backend/badge.svg) ![frontend](https://github.com/tsl0922/ttyd/workflows/frontend/badge.svg)

ttyd is a simple command-line tool for sharing terminal over the web.

![screenshot](https://raw.githubusercontent.com/nrikas/ttyd-kali/master/Untitled.png)
![screenshot](https://alpinesecurity.com/wp-content/uploads/2020/02/sqlmap.png)

# Optional

I've included the minio client binary file(mc) in this repo. Head over to [heroku-minio](https://github.com/capriciousduck/heroku-minio) to host your own MinIO server on Heroku. Remember to make a HTTP request to your app, for example, from UptimeRobot to prevent the dyno from sleeping.

# Features

- Built on top of [Libwebsockets](https://libwebsockets.org) with [libuv](https://libuv.org) for speed
- Fully-featured terminal based on [Xterm.js](https://xtermjs.org) with [CJK](https://en.wikipedia.org/wiki/CJK_characters) and IME support
- Graphical [ZMODEM](https://en.wikipedia.org/wiki/ZMODEM) integration with [lrzsz](https://ohse.de/uwe/software/lrzsz.html) support
- SSL support based on [OpenSSL](https://www.openssl.org)
- Run any custom command with options
- Basic authentication support and many other custom options
- Cross platform: macOS, Linux, FreeBSD/OpenBSD, [OpenWrt](https://openwrt.org), Windows


## Command-line Options For Use In Dockerfile

```
ttyd is a tool for sharing terminal over the web

USAGE:
    ttyd [options] <command> [<arguments...>]

VERSION:
    1.6.1

OPTIONS:
    -p, --port              Port to listen (default: 7681, use `0` for random port)
    -i, --interface         Network interface to bind (eg: eth0), or UNIX domain socket path (eg: /var/run/ttyd.sock)
    -c, --credential        Credential for Basic Authentication (format: username:password)
    -u, --uid               User id to run with
    -g, --gid               Group id to run with
    -s, --signal            Signal to send to the command when exit it (default: 1, SIGHUP)
    -a, --url-arg           Allow client to send command line arguments in URL (eg: http://localhost:7681?arg=foo&arg=bar)
    -R, --readonly          Do not allow clients to write to the TTY
    -t, --client-option     Send option to client (format: key=value), repeat to add more options
    -T, --terminal-type     Terminal type to report, default: xterm-256color
    -O, --check-origin      Do not allow websocket connection from different origin
    -m, --max-clients       Maximum clients to support (default: 0, no limit)
    -o, --once              Accept only one client and exit on disconnection
    -B, --browser           Open terminal with the default system browser
    -I, --index             Custom index.html path
    -b, --base-path         Expected base path for requests coming from a reverse proxy (eg: /mounted/here)
    -6, --ipv6              Enable IPv6 support
    -S, --ssl               Enable SSL
    -C, --ssl-cert          SSL certificate file path
    -K, --ssl-key           SSL key file path
    -A, --ssl-ca            SSL CA file path for client certificate verification
    -d, --debug             Set log level (default: 7)
    -v, --version           Print the version and exit
    -h, --help              Print this text and exit

Visit https://github.com/tsl0922/ttyd to get more information and report bugs.
```

Read the example usage on the [wiki](https://github.com/tsl0922/ttyd/wiki/Example-Usage).

# Reference
https://github.com/tsl0922/ttyd

Thanks to *tsl0922*.
