#!/bin/bash
while true; do
    flannel_id=$(docker -H unix:///var/run/docker-bootstrap.sock ps | grep flannel | awk '{ print $1 }')
    docker -H unix:///var/run/docker-bootstrap.sock exec $flannel_id cat /run/flannel/subnet.env \
        > /tmp/flannel.cfg
    subnet=$(grep FLANNEL_SUBNET /tmp/flannel.cfg | awk -F = '{ print $2 }')
    mtu=$(grep FLANNEL_MTU /tmp/flannel.cfg | awk -F = '{ print $2 }')
    echo "DOCKER_OPTS=\"--bip=${subnet} --mtu=${mtu}\"" > /etc/default/docker
    if [ "$subnet" != "" -a "$mtu" != "" ]; then
        break
    fi
done

ifconfig docker0 down
brctl delbr docker0
