# Home Assistant Add-on: evcc (Proxy)

This add-on provides Home Assistant Ingress access to an externally hosted [evcc](https://evcc.io) instance.

It does **not** run evcc itself. It only proxies an existing evcc installation.

## Configuration

Set the external evcc URL in add-on options:

```yaml
evcc-url: http://192.168.1.50:7070
```