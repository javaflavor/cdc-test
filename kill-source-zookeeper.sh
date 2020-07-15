#!/bin/sh -v

oc delete pod my-cluster-zookeeper-0 -n cdc-source --force --grace-period=0
