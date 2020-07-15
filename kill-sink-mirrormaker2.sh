#!/bin/sh -v

oc delete $(oc get pod -l strimzi.io/name=my-mm2-cluster-mirrormaker2 -n cdc-sink -o=name) -n cdc-sink --force --grace-period=0
