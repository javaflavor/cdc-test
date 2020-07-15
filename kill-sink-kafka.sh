#!/bin/sh -v

oc delete pod my-cluster-kafka-0 -n cdc-sink --force --grace-period=0
