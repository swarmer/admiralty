#!/bin/bash
until curl http://{{ master_private_ip }}:4001/v2/machines; do
    sleep 1;
done
