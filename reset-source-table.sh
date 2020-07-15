#!/bin/sh -v

oc exec -n cdc-source -it \
 $(oc get pod -n cdc-source -l deploymentconfig=mysql -n cdc-source -o=jsonpath='{.items[0].metadata.name}') \
 -- /opt/rh/rh-mysql57/root/usr/bin/mysql -u mysqluser --password=mysqlpw inventory \
 -e "delete from customers where id > 2000;"

