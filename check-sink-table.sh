#!/bin/sh

while true; do
  now=$(date '+%Y-%m-%d %H:%M:%S')
  oc exec -n cdc-sink -it \
 $(oc get pod -n cdc-sink -l deploymentconfig=mysql -o=jsonpath='{.items[0].metadata.name}') \
 -- /opt/rh/rh-mysql57/root/usr/bin/mysql -u mysqluser --password=mysqlpw inventory \
 -e "select count(id) from customers;" | sed "s/^/${now} /"
  sleep 1;
done

