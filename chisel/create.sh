if [ ! -d "data/" ]; then
  echo "Please generate the server key."
  exit 1
fi

if [ ! -f "users.json" ]; then
  echo "Please create the users.json file: more at https://github.com/jpillora/chisel"
  exit 1
fi

podman run --replace --network podman-default-kube-network --name chisel -d \
  -v ./data:/data:z -v ./users.json:/config/users.json:z \
  jpillora/chisel:latest server --authfile /config/users.json --port 80 --keyfile /data/key.pem

