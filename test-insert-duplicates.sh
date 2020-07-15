#!/bin/sh

now=$(date '+%Y-%m-%d %H:%M:%S')

i=1

(oc exec -n cdc-source -it \
 $(oc get pod -n cdc-source -l deploymentconfig=mysql -o=jsonpath='{.items[0].metadata.name}') \
 -- mysql -u mysqluser --password=mysqlpw inventory \
  -e "insert into customers values (200${i}, 'Sink${i}', 'Sinks', 'sink${i}@example.com');" | sed "s/^/${now} /" ) &

oc exec -n cdc-sink -it \
 $(oc get pod -n cdc-sink -l deploymentconfig=mysql -o=jsonpath='{.items[0].metadata.name}') \
 -- mysql -u mysqluser --password=mysqlpw inventory \
  -e "insert into customers values (200${i}, 'Sink${i}', 'Sinks', 'sink${i}@example.com');" | sed "s/^/${now} /"

