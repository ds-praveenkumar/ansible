# ansible
This repo contains ansible code


commands
```
docker build . -t ansible
docker run -it ansible

 ansible localhost -m ping

 ```
configure ansible
```
mkdir /etc/ansible
vi etc/ansible/ansible.cfg

vi /etc/ansible/hosts/main_docker.yml

ansible-inventory --graph
```
ansible ssh test
```
docker pull jcpowermac/alpine-ansible-ssh
docker run --name=controller --platform linux/amd64 -d jcpowermac/alpine-ansible-ssh
docker run --name=target1 --platform linux/amd64 -d jcpowermac/alpine-ansible-ssh
docker run --name=target2 --platform linux/amd64 -d jcpowermac/alpine-ansible-ssh

docker ps
for i in $(docker ps|awk '{print $1}'|tail -n +2); do docker exec $i ip a|grep 172.17;done
docker exec -it controller /bin/sh
cd /home/ansible/projects
ssh 172.17.0.3
ssh 172.17.0.4
vi inventory.txt
target1 ansible_host=172.17.0.3
target2 ansible_host=172.17.0.4

ansible target* -m ping -i inventory.txt

ansible-playbook playbook.yml -i inventory.txt 