#!/bin/bash
sudo docker stop wordpress && sudo docker rm wordpress
sudo docker build -t wordpress .
sudo docker run -it --name wordpress --network app-network \
    --env-file /home/mole_pc/Desktop/schoolinsp/inception/srcs/.env \
    -v /home/mole_pc/Desktop/schoolinsp/data/WordPress:/var/www/WordPress \
    wordpress /bin/bash
