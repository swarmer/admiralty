#!/bin/bash
flannel_id=$(docker -H unix:///var/run/docker-bootstrap.sock ps | grep flannel | awk '{ print $1 }')
docker -H unix:///var/run/docker-bootstrap.sock exec $flannel_id cat /run/flannel/subnet.env \
    > /etc/default/docker
subnet=$(grep FLANNEL_SUBNET /etc/default/docker | awk -F = '{ print $2 }')
mtu=$(grep FLANNEL_MTU /etc/default/docker | awk -F = '{ print $2 }')
echo "DOCKER_OPTS=\"--bip=${subnet} --mtu=${mtu}\"" > /etc/default/docker
