mkdir  /root/komodo-wallet-desktop
docker run -it --net host -d -v /root/komodo-wallet-desktop:/opt/komodo-desktop-wallet debian:11
sleep 1s
echo 'docker exec -it <docker_hash_here> bash'
sleep 2s

chmod 1777 /tmp
apt update
apt install wget sudo -y && wget https://raw.githubusercontent.com/bitnet-io/bitstock-wallet-desktop/main/build-env.sh && chmod +x build-env.sh && ./build-env.sh



echo 'then run'
cmake --build . --config Release --target komodo-wallet

