mkdir -p data
podman run -it --replace --network podman-default-kube-network --name chisel\
  -v ./data:/data:z \
  -it jpillora/chisel:latest server --keygen /data/key.pem

# version: "3"

# services:
#   chisel:
#     image: jpillora/chisel:latest
#     container_name: chisel
#     command: server --auth ascpial:zXfaRJauyO0u9RjsUm4Y7a9qhBc5x5qewzUPf49IyJ86lqqPYW
#     restart: always
#     environment:
#     - PORT=8080
#     - CHISEL_KEY=5qWq,X1'@X2*YpnA+(hr
#     networks:
#     - web

# networks:
#   web:
#     external: true
