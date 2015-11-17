#!/bin/bash
until curl http://{{ kubernetes_master_ip }}:4001/v2/machines; do
    sleep 1;
done
