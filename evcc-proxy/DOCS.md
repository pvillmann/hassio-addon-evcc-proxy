# evcc (Proxy) — Documentation

This add-on is a Home Assistant Ingress reverse proxy for externally hosted evcc instances.
It does not run evcc itself.

## Prerequisites

- A running evcc instance reachable from your Home Assistant host.
- The evcc web UI is reachable at a known URL (e.g. `http://192.168.1.50:7070`).

## Configuration

| Option | Required | Description |
|--------|----------|-------------|
| `evcc-url` | yes | Full URL of your external evcc instance |

**Example:**

```yaml
evcc-url: http://192.168.1.50:7070
```

## How it works

The add-on runs an nginx reverse proxy inside a container.
Home Assistant Ingress forwards requests to the proxy (port 8099), which proxies them to `evcc-url`.
WebSocket connections are forwarded transparently.

## Firewall notes

Home Assistant must be able to reach the configured `evcc-url` directly.
If your evcc host has a firewall enabled, allow the IP address of your HA host.

## Troubleshooting

- **502 Bad Gateway**: evcc is not reachable at the configured URL.
- **Blank page**: verify `evcc-url` and check evcc logs.
