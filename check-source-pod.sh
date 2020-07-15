#!/bin/sh

while true; do
  now=$(date '+%Y-%m-%d %H:%M:%S')
  oc get pod -n cdc-source \
 | sed "s/^/${now} /"
  echo ""
  sleep 1;
done

