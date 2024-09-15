# ascpiserv

This is the repo I'll be using to store the configuration of my new infrastructure.

The services lies behind a Caddy reverse-proxy (which will handle SSL).

The services currently implemented are:
- Nextcloud, a all-in-one cloud platform;
- chisel, a tcp-over-websocket proxy which allows me to bypass a lot of restricted networks, such as school networks.

The services I'm looking toward implementing are:
- Wireguard for easy trafic tunneling and virtual private network;
- Synapse/Dendrite for a Matrix server;

## Structure

Each services is contained in a folder. To enable the services, there is a `start.sh` script in each folder.

Some services needs preperation, such as build or configuration.
The start script warns you when needed.
