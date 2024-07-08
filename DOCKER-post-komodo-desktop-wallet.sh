docker run -it --net host -d -v /root/komodo-wallet-desktop:/opt/komodo-desktop-wallet debian:10
docker exec -it <docker_hash_here> bash


cmake --build . --config Release --target komodo-wallet
