export $(xargs <config.env)
export $(xargs <../general.env)

echo "# Don't edit this generated file. Edit config.env and Caddyfile instead." > CaddyfileGenerated
envsubst < Caddyfile >> CaddyfileGenerated

podman run -it --replace --name caddy --network podman-default-kube-network --security-opt label=disable \
  -p $HTTP_PORT:$HTTP_PORT -p $HTTPS_PORT:$HTTPS_PORT \
  -v ./CaddyfileGenerated:/etc/caddy/Caddyfile -v ./data/logs:/var/log/caddy -v ./data/caddy:/data \
  caddy
