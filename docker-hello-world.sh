#!/bin/bash

#Installation part
#for java
sudo apt install default-jdk
sudo apt install default-jre
java -version
#--------------------------------

echo "[root@localhost ~]# cd /"
cd /
echo "[root@localhost /]# mkdir -p docker/hello-world-java"
mkdir -p docker/hello-world-java
echo "[root@localhost /]# cd docker/hello-world-java"
cd docker/hello-world-java
sudo bash -c"cat > HelloWorld.java<<EOF
public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World");
    }
}
EOF"
echo "[root@localhost hello-world-java]# vi HelloWorld.java"
sudo vi HelloWorld.java
echo "[root@localhost hello-world-java]# javac HelloWorld.java"
javac HelloWorld.java
echo "[root@localhost hello-world-java]# java HelloWorld.java"
javac HelloWorld.java

sudo bash -c"cat > Dockerfile<<EOF
FROM openjdk:latest

WORKDIR /app

COPY .   /app

RUN javac HelloWorld.java

CMD ["java", "HelloWorld"]
EOF"
echo "[root@localhost hello-world-java]# vi Dockerfile"
sudo vi Dockerfile
echo "[root@localhost hello-world-java]# docker build -t java-hello-world ."
docker build -t java-hello-world .
echo "[root@localhost hello-world-java]# docker container run --name java-hello-world java-hello-world"
docker container run --name java-hello-world java-hello-world
#echo "[root@localhost hello-world-java]# sudo docker container top java-hello-world"
#sudo docker container top java-hello-world
#echo "[root@localhost hello-world-java]# sudo docker container stats java-hello-world"
#sudo docker container stats java-hello-world
#echo "[root@localhost hello-world-java]# sudo docker container inspect java-hello-world"
#sudo docker container inspect java-hello-world
