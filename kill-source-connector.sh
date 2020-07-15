#!/bin/sh -v

oc delete $(oc get pod -l deploymentconfig=my-connect-cluster-connect -n cdc-source -o=name) -n cdc-source --force --grace-period=0
