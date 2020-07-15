#!/bin/sh -v

oc delete pod my-cluster-zookeeper-0 -n cdc-sink --force --grace-period=0
