docker run -it --net host -d -v /root/komodo-wallet-desktop:/opt/komodo-desktop-wallet debian:10
sleep 1s
echo 'docker exec -it <docker_hash_here> bash'
sleep 2s






echo 'then run'
cmake --build . --config Release --target komodo-wallet

