### Quick Start

```bash
git clone https://github.com/clivern/ote.git
cd ote

# Copy the sample configuration and adjust values as needed
cp config.dist.yml config.prod.yml

# Run the API server with the sample config
make run

# Alternatively, run with custom config
go run ote.go server --config /path/to/config.yml
```

The server listens on the port defined in the configuration (`app.port`, defaults to `8000`):

- Health check: `GET http://localhost:8000/_health`
- Prometheus metrics: `GET http://localhost:8000/_metrics` (basic auth; defaults `admin` / `secret`)


### Deployment

The `release/` directory ships two Ansible roles:

- `roles/app`: Installs the Ote binary
- `roles/otel`: Installs the OpenTelemetry Collector

To target a server, adjust `release/inventory.yml`, then run:

```bash
ansible-playbook -i release/inventory.yml release/playbook.yml
```

You can override versions and `Dash0` credentials directly from the playbook for environment-specific values.


### Testing

Run the provided make targets:

```bash
make fmt           # gofmt all Go files
make test          # run unit tests
make lint          # run revive
make ci            # execute the full quality suite
```


### License

Distributed under the MIT License. See [`LICENSE`](LICENSE) for more information.
