mkdir  /root/komodo-wallet-desktop

echo 'this will log you out of gnomewm or lightdm and you need to log back in because the host will hook PID 1 into the guest'
sleep 2
'docker run -it --privileged  --net host -d -v /root/komodo-wallet-desktop:/opt/komodo-desktop-wallet fedora:39 /sbin/init'

sleep 1s
echo 'docker exec -it <docker_hash_here> bash'
sleep 2s

cd /opt/komodo-desktop-wallet
wget https://raw.githubusercontent.com/bitnet-io/bitstock-wallet-desktop/main/build-env.sh && chmod +x build-env.sh && ./build-env.sh



echo 'then run'
cmake --build . --config Release --target komodo-wallet

