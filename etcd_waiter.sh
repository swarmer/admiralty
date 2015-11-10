#!/bin/bash
until curl http://127.0.0.1:4001/v2/machines; do
    sleep 1;
done
