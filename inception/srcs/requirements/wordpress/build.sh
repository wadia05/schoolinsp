#!/bin/bash
sudo docker stop wordpress && sudo docker rm wordpress
sudo docker build -t wordpress .
sudo docker run -it --name wordpress --network app-network wordpress /bin/bash
