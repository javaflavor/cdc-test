#!/bin/sh

  now=$(date '+%Y-%m-%d %H:%M:%S')
#  oc exec -n cdc-source -it \
# $(oc get pod -n cdc-source -l deploymentconfig=mysql -o=jsonpath='{.items[0].metadata.name}') \
# -- /opt/rh/rh-mysql57/root/usr/bin/mysql -u mysqluser --password=mysqlpw inventory \
# -e "select count(id) from customers;" | sed "s/^/${now} /"
  oc exec -n cdc-source -it \
 $(oc get pod -n cdc-source -l deploymentconfig=mysql -o=jsonpath='{.items[0].metadata.name}') \
 -- mysql -u mysqluser --password=mysqlpw inventory \
 -e "select count(id) from customers;" | sed "s/^/${now} /"

