# Check if the image has been built
if [ -z "$(podman images -q localhost/nextcloud:latest)" ]; then
  echo "You haven't build the nextcloud image yet."
  echo "Run ./build. to do so."
  exit 1
fi

# Load configuration (domain name, ports...)
export $(xargs <config.env)
export $(xargs <../general.env)
DOMAIN_NAME=cloud.$ROOT_DOMAIN

# Create data folders
# sudo rm -rf /var/home/ascpial/.var/ascpiserv/nextcloud
mkdir -p $DATA_FOLDER
mkdir -p $DATA_FOLDER/nextcloud
mkdir -p $DATA_FOLDER/nextcloud/data $DATA_FOLDER/nextcloud/html $DATA_FOLDER/nextcloud/database

# Generate kube file with the loaded config variables set
echo "# Don't edit this generated file. Edit config.env and kube.yml." > kubegenerated.yml
envsubst < kube.yml >> kubegenerated.yml

# Start the pod
podman play kube --replace kubegenerated.yml
