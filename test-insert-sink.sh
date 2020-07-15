#!/bin/sh

for i in {1..50}; do
  now=$(date '+%Y-%m-%d %H:%M:%S')
  echo "${now} Inserting User${i}."
#  oc exec -n cdc-source -it \
# $(oc get pod -n cdc-source -l deploymentconfig=mysql -n cdc-source -o=jsonpath='{.items[0].metadata.name}') \
# -- /opt/rh/rh-mysql57/root/usr/bin/mysql -u mysqluser --password=mysqlpw inventory \
#  -e "insert into customers values (200${i}, 'User${i}', 'Users', 'user${i}@example.com');" | sed "s/^/${now} /"
  oc exec -n cdc-sink -it \
 $(oc get pod -n cdc-sink -l deploymentconfig=mysql -o=jsonpath='{.items[0].metadata.name}') \
 -- mysql -u mysqluser --password=mysqlpw inventory \
  -e "insert into customers values (200${i}, 'Sink${i}', 'Sinks', 'sink${i}@example.com');" | sed "s/^/${now} /"
done

