#!/bin/sh -v

oc delete $(oc get pod -l deploymentconfig=my-connect-cluster-connect -n cdc-sink -o=name) -n cdc-sink --force --grace-period=0
