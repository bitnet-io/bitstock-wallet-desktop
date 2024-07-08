docker run -it --net host -d -v /root/komodo-wallet-desktop:/opt/komodo-desktop-wallet debian:10
sleep 1s
echo 'docker exec -it <docker_hash_here> bash'
sleep 2s

apt-get update
apt install wget -y

wget https://raw.githubusercontent.com/bitnet-io/bitstock-wallet-desktop/main/DOCKER-post-komodo-desktop-wallet.sh
chmod +x DOCKER-post-komodo-desktop-wallet.sh

./DOCKER-post-komodo-desktop-wallet.sh
echo 'then run'
cmake --build . --config Release --target komodo-wallet
