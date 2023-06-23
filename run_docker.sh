#! bin/bash

docker stop $(docker ps -a -q)
docker rm `docker ps --no-trunc -aq`
docker run --name=controller --platform linux/amd64 -d jcpowermac/alpine-ansible-ssh
docker run --name=target1 --platform linux/amd64 -d jcpowermac/alpine-ansible-ssh
docker run --name=target2 --platform linux/amd64 -d jcpowermac/alpine-ansible-ssh


for i in $(docker ps|awk '{print $1}'|tail -n +2); do docker exec $i ip a|grep 172.17;done
cont_id=`docker ps -aqf "name=controller"`
echo $cont_id
docker cp tags.txt $cont_id:/tags.txt
docker cp playbook.yml $cont_id:/playbook.yml
docker cp ansible.txt $cont_id:/ansible.txt

docker exec -it controller /bin/sh

