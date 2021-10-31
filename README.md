# Docker ghostunnel

Docker image build for [ghostunnel](https://github.com/ghostunnel/ghostunnel), using distroless as a base image instead of alpine.

[![Docker hub](https://img.shields.io/docker/pulls/containerinfra/ghostunnel.svg)](https://hub.docker.com/r/containerinfra/ghostunnel/) ![GitHub Workflow Status](https://img.shields.io/github/workflow/status/containerinfra/ghostunnel/release)

## Table of Contents

- [Usage](#usage)
- [Contribute](#contribute)
- [License](#license)

## Usage

### Images

- docker pull docker.io/containerinfra/ghostunnel:1.6.0
- docker pull ghcr.io/containerinfra/ghostunnel:1.6.0

### Verify image with cosign

All containerinfra/ghostunnel images are signed by [cosign](https://github.com/sigstore/cosign). You can verify these using `cosign verify`:

```bash
cat cosign.pub
-----BEGIN PUBLIC KEY-----
MFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEYpxYmR6qpyer9WJHhSxd91XMx+A+
eQm/6XSWAMDGeH4hrFpvo8Sw0t+xf0PdRSUEXCyKFXve+Q2s8csVo4eAaA==
-----END PUBLIC KEY-----


cosign verify --key cosign.pub docker.io/containerinfra/ghostunnel:1.6.0
cosign verify --key cosign.pub ghcr.io/containerinfra/ghostunnel:1.6.0
```

### Configuration

See the [ghostunnel documentation](https://github.com/ghostunnel/ghostunnel).

```bash
usage: ghostunnel [<flags>] <command> [<args> ...]

A simple SSL/TLS proxy with mutual authentication for securing non-TLS services.

Flags:
  --help                        Show context-sensitive help (also try --help-long and --help-man).
  --keystore=PATH               Path to keystore (combined PEM with cert/key, or PKCS12 keystore).
  --cert=PATH                   Path to certificate (PEM with certificate chain).
  --key=PATH                    Path to certificate private key (PEM with private key).
  --storepass=PASS              Password for keystore (if using PKCS keystore, optional).
  --cacert=CACERT               Path to CA bundle file (PEM/X509). Uses system trust store by default.
  --cipher-suites="AES,CHACHA"  Set of cipher suites to enable, comma-separated, in order of preference (AES, CHACHA).
  --use-workload-api            If true, certificate and root CAs are retrieved via the SPIFFE Workload API
  --use-workload-api-addr=ADDR  If set, certificates and root CAs are retrieved via the SPIFFE Workload API at the specified address (implies --use-workload-api)
  --timed-reload=DURATION       Reload keystores every given interval (e.g. 300s), refresh listener/client on changes.
  --shutdown-timeout=5m         Graceful shutdown timeout. Terminates after timeout even if connections still open.
  --connect-timeout=10s         Timeout for establishing connections, handshakes.
  --metrics-graphite=ADDR       Collect metrics and report them to the given graphite instance (raw TCP).
  --metrics-url=URL             Collect metrics and POST them periodically to the given URL (via HTTP/JSON).
  --metrics-prefix=PREFIX       Set prefix string for all reported metrics (default: ghostunnel).
  --metrics-interval=30s        Collect (and post/send) metrics every specified interval.
  --status=ADDR                 Enable serving /_status and /_metrics on given HOST:PORT (or unix:SOCKET).
  --enable-pprof                Enable serving /debug/pprof endpoints alongside /_status (for profiling).
  --quiet= ...                  Silence log messages (can be all, conns, conn-errs, handshake-errs; repeat flag for more than one)
  --syslog                      Send logs to syslog instead of stderr.
  --pkcs11-module=PATH          Path to PKCS11 module (SO) file (optional).
  --pkcs11-token-label=LABEL    Token label for slot/key in PKCS11 module (optional).
  --pkcs11-pin=PIN              PIN code for slot/key in PKCS11 module (optional).
  --version                     Show application version.

Commands:
  help [<command>...]
    Show help.


  server --listen=ADDR --target=ADDR [<flags>]
    Server mode (TLS listener -> plain TCP/UNIX target).

    --listen=ADDR             Address and port to listen on (can be HOST:PORT, unix:PATH, systemd:NAME or launchd:NAME).
    --target=ADDR             Address to forward connections to (can be HOST:PORT or unix:PATH).
    --proxy-protocol          Enable PROXY protocol v2 to signal connection info to backend
    --unsafe-target           If set, does not limit target to localhost, 127.0.0.1, [::1], or UNIX sockets.
    --allow-all               Allow all clients, do not check client cert subject.
    --allow-cn=CN ...         Allow clients with given common name (can be repeated).
    --allow-ou=OU ...         Allow clients with given organizational unit name (can be repeated).
    --allow-dns=DNS ...       Allow clients with given DNS subject alternative name (can be repeated).
    --allow-uri=URI ...       Allow clients with given URI subject alternative name (can be repeated).
    --disable-authentication  Disable client authentication, no client certificate will be required.

  client --listen=ADDR --target=ADDR [<flags>]
    Client mode (plain TCP/UNIX listener -> TLS target).

    --listen=ADDR                Address and port to listen on (can be HOST:PORT, unix:PATH, systemd:NAME or launchd:NAME).
    --target=ADDR                Address to forward connections to (must be HOST:PORT).
    --unsafe-listen              If set, does not limit listen to localhost, 127.0.0.1, [::1], or UNIX sockets.
    --override-server-name=NAME  If set, overrides the server name used for hostname verification.
    --connect-proxy=URL          If set, connect to target over given HTTP CONNECT proxy. Must be HTTP/HTTPS URL.
    --verify-cn=CN ...           Allow servers with given common name (can be repeated).
    --verify-ou=OU ...           Allow servers with given organizational unit name (can be repeated).
    --verify-dns=DNS ...         Allow servers with given DNS subject alternative name (can be repeated).
    --verify-uri=URI ...         Allow servers with given URI subject alternative name (can be repeated).
    --disable-authentication     Disable client authentication, no certificate will be provided to the server.
```

## Automated build

This image is build at least once a month automatically.

## Contribute

PRs accepted. All issues should be reported in the [Github issue tracker](https://github.com/containerinfra/ghostunnel/issues).

## License

[MIT © ContainerInfra](LICENSE)
