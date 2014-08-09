Centos Fuseki Docker
=========

This is the docker implementation of fuseki server. Developer needs to do the following before using it

  - Install docker
  - Install boot2docker
  - Build the docker container
  - Run it for the first time and populate the controlled vocabulary.
  - Commit the changes to the container after adding the triples with a tag
  - Use the tagged container


Todo
------
- Document the details

Commands
--------
Instantiate the boot2docker

```sh
boot2loader init
```

Open ports on the docker container

```sh
./setupport.sh
```

Start the boot2docker

```sh
boot2loader up
```

Setup the docker host

```sh
export DOCKER_HOST=tcp://192.168.59.104:2375
```

Go to the folder containing Dockerfile and build docker container

```sh
docker build -t mlk0007/centos-fuseki .
```

To run the docker image with access to the bash prompt

```sh
docker run -t -i -p 3030:3030  mlk0007/centos-fuseki /bin/bash
bash-4.1#
```

Previous command will start a bash prompt within the docker container

```sh
bash-4.1#
#exit to stop
```

Run the docker image

```sh
docker run -d -p 3030:3030  mlk0007/centos-fuseki
```


Tag the container

```sh
docker commit 5f770ee0c4a1 mlk0007/centos-fuseki:loaded
```

Run the tagged version of the docker image

```sh
docker run -d -p 3030:3030  mlk0007/centos-fuseki:loaded
```

Important Docker Commands
-------------------------


List all docker images

```sh
docker images
```
List all running docker images

```sh
docker ps
```

Stop a running docker image

```sh
docker stop CONTAINERID
```

Remove a docker image

```sh
docker rmi -f IMAGEID
```

Version
-------
1.0

** Enjoy docker **
