#!/bin/bash

# install all the angular dependancy

sudo npm install

#build the application
sudo ng build --prod

# remove the container if exists or running 
if [ $(sudo docker container ls -q -a --filter name=myang_c) != '' ]; then
    sudo docker container stop myang_c
    sudo docker container rm myang_c
fi

# remove the image if exists
if [ $(sudo docker image ls -q --filter reference=myang) != '' ]; then
    sudo docker image rm myang
fi

# build the image
sudo docker build -t myang .

# start the container
sudo docker container run -itd -p 7000:80 --name myang_c myang