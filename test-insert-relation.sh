#!/bin/sh

for i in {1..5}; do
  now=$(date '+%Y-%m-%d %H:%M:%S')
  echo "${now} Inserting User${i}."
#  oc exec -n cdc-source -it \
# $(oc get pod -n cdc-source -l deploymentconfig=mysql -n cdc-source -o=jsonpath='{.items[0].metadata.name}') \
# -- /opt/rh/rh-mysql57/root/usr/bin/mysql -u mysqluser --password=mysqlpw inventory \
#  -e "begin; insert into customers values (200${i}, 'User${i}', 'Users', 'user${i}@example.com'); insert into addresses values (${i}, 200${i}, '${i} street', 'City ${i}', 'State ${i}', '10${i}', 'LIVING'); COMMIT" | sed "s/^/${now} /"
  oc exec -n cdc-source -it \
 $(oc get pod -n cdc-source -l deploymentconfig=mysql -n cdc-source -o=jsonpath='{.items[0].metadata.name}') \
 -- mysql -u mysqluser --password=mysqlpw inventory \
  -e "begin; insert into customers values (200${i}, 'User${i}', 'Users', 'user${i}@example.com'); insert into addresses values (${i}, 200${i}, '${i} street', 'City ${i}', 'State ${i}', '10${i}', 'LIVING'); COMMIT" | sed "s/^/${now} /"
done

